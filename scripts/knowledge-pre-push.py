#!/usr/bin/env python3
"""Repair stale kgdistiller source bindings and site export before a push."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile


REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
GRAPH_MANIFEST = REPOSITORY_ROOT / "knowledge/graph/manifest.json"
EXPORT_MANIFEST = REPOSITORY_ROOT / "knowledge/export/site/manifest.json"
EXPORT_ROOT = REPOSITORY_ROOT / "knowledge/export/site"
GIT = os.environ.get("NOTES_GIT") or (
	"/opt/homebrew/bin/git"
	if Path("/opt/homebrew/bin/git").is_file()
	else shutil.which("git") or "git"
)
if Path(GIT).is_absolute():
	os.environ["PATH"] = str(Path(GIT).parent) + os.pathsep + os.environ["PATH"]


def run(
	*command: str,
	check: bool = True,
	capture: bool = False,
	env: dict[str, str] | None = None,
) -> subprocess.CompletedProcess[str]:
	return subprocess.run(
		command,
		cwd=REPOSITORY_ROOT,
		check=check,
		text=True,
		stdout=subprocess.PIPE if capture else None,
		stderr=subprocess.PIPE if capture else None,
		env=env,
	)


def git(
	*arguments: str,
	check: bool = True,
	capture: bool = False,
) -> subprocess.CompletedProcess[str]:
	return run(GIT, *arguments, check=check, capture=capture)


def canonical_sha256(path: Path) -> str:
	text = path.read_text(encoding="utf-8").replace("\r\n", "\n").replace("\r", "\n")
	return hashlib.sha256(text.encode("utf-8")).hexdigest()


def stale_sources() -> tuple[list[str], list[str]]:
	manifest = json.loads(GRAPH_MANIFEST.read_text(encoding="utf-8"))
	stale: list[str] = []
	missing: list[str] = []
	for relative_path, expected_hash in manifest["source_hashes"].items():
		path = REPOSITORY_ROOT / relative_path
		if not path.is_file():
			missing.append(relative_path)
		elif canonical_sha256(path) != expected_hash:
			stale.append(relative_path)
	return stale, missing


def clean_worktree() -> bool:
	return not git("status", "--porcelain", "--untracked-files=all", capture=True).stdout


def changed_paths() -> list[str]:
	lines = git("status", "--porcelain", "--untracked-files=all", capture=True).stdout.splitlines()
	paths: list[str] = []
	for line in lines:
		path = line[3:]
		if " -> " in path:
			path = path.split(" -> ", 1)[1]
		paths.append(path)
	return paths


def knowledge_check() -> bool:
	commands = [
		(
			sys.executable,
			"knowledge/export/site/verify_export.py",
			"knowledge/export/site",
		),
		("node", "tests/knowledge-export.test.mjs"),
	]
	return all(run(*command, check=False).returncode == 0 for command in commands)


def require_clean_worktree() -> None:
	if clean_worktree():
		return
	print(
		"knowledge pre-push: worktree is not clean; commit or stash current work, then push again.",
		file=sys.stderr,
	)
	raise SystemExit(1)


def require_kgdistiller() -> None:
	if shutil.which("kgdistiller"):
		return
	print(
		"knowledge pre-push: kgdistiller is required to refresh stale knowledge data.",
		file=sys.stderr,
	)
	raise SystemExit(1)


def sync_registered_sources() -> None:
	print("knowledge pre-push: synchronizing registered sources")
	result = run(
		"kgdistiller",
		"--repo-root",
		str(REPOSITORY_ROOT),
		"sync",
		capture=True,
	)
	print(result.stdout, end="")
	receipt = json.loads(result.stdout)
	needs_review = receipt.get("needs_review", {})
	if receipt.get("warnings", 0) or any(needs_review.values()):
		print(
			"knowledge pre-push: sync requires review; changes were left uncommitted for inspection.",
			file=sys.stderr,
		)
		raise SystemExit(1)

	unexpected = [path for path in changed_paths() if not path.startswith("knowledge/")]
	if unexpected:
		print(
			"knowledge pre-push: kgdistiller changed files outside knowledge/; refusing to commit automatically:\n"
			+ "\n".join(f"  {path}" for path in unexpected),
			file=sys.stderr,
		)
		raise SystemExit(1)

	run("kgdistiller", "--repo-root", str(REPOSITORY_ROOT), "check")
	run("kgdistiller", "--repo-root", str(REPOSITORY_ROOT), "agent", "status")
	git("add", "--", "knowledge")
	git("commit", "-m", "knowledge: sync registered sources", "--", "knowledge")


def installed_product_runtime() -> tuple[str, Path]:
	executable = shutil.which("kgdistiller")
	if executable is None:
		raise RuntimeError("kgdistiller executable is unavailable")
	first_line = Path(executable).read_text(encoding="utf-8").splitlines()[0]
	if not first_line.startswith("#!"):
		raise RuntimeError(
			"cannot locate the Python runtime behind the kgdistiller executable"
		)
	python = first_line[2:]
	result = subprocess.run(
		[
			python,
			"-c",
			"import kgdistiller, pathlib; print(pathlib.Path(kgdistiller.__file__).resolve().parents[2])",
		],
		check=True,
		capture_output=True,
		text=True,
	)
	root = Path(result.stdout.strip())
	if not (root / ".git").exists():
		raise RuntimeError(
			"the installed kgdistiller is not backed by a discoverable Git checkout"
		)
	return python, root


def run_pinned_export(manifest: dict[str, object]) -> None:
	producer = manifest["producer"]
	source = manifest["source"]
	assert isinstance(producer, dict)
	assert isinstance(source, dict)
	commit = str(producer["commit"])
	python, product_root = installed_product_runtime()
	if git(
		"-C",
		str(product_root),
		"cat-file",
		"-e",
		f"{commit}^{{commit}}",
		check=False,
		capture=True,
	).returncode != 0:
		raise RuntimeError(f"selected kgdistiller commit is unavailable locally: {commit}")

	with tempfile.TemporaryDirectory(prefix="notes-kgdistiller-") as temporary:
		checkout = Path(temporary) / "kgdistiller"
		run(
			GIT,
			"clone",
			"--quiet",
			"--shared",
			"--no-checkout",
			str(product_root),
			str(checkout),
		)
		run(GIT, "-C", str(checkout), "checkout", "--quiet", "--detach", commit)
		environment = os.environ.copy()
		environment["PYTHONPATH"] = str(checkout / "src")
		environment["PATH"] = str(Path(GIT).parent) + os.pathsep + environment["PATH"]
		run(
			python,
			"-m",
			"kgdistiller",
			"--repo-root",
			str(REPOSITORY_ROOT),
			"export",
			"site",
			"--output",
			str(EXPORT_ROOT),
			"--product-commit",
			commit,
			"--product-repository",
			str(producer["repository"]),
			"--source-repository",
			str(source["repository"]),
			"--replace",
			env=environment,
		)


def refresh_export() -> None:
	manifest = json.loads(EXPORT_MANIFEST.read_text(encoding="utf-8"))
	print("knowledge pre-push: refreshing the adopted static site export")
	run_pinned_export(manifest)

	unexpected = [
		path for path in changed_paths() if not path.startswith("knowledge/export/site/")
	]
	if unexpected:
		print(
			"knowledge pre-push: export changed unexpected files; refusing to commit automatically:\n"
			+ "\n".join(f"  {path}" for path in unexpected),
			file=sys.stderr,
		)
		raise SystemExit(1)

	run("python3", "knowledge/export/site/verify_export.py", "knowledge/export/site")
	git("add", "--", "knowledge/export/site")
	git(
		"commit",
		"-m",
		"knowledge: refresh site export",
		"--",
		"knowledge/export/site",
	)


def main() -> int:
	parser = argparse.ArgumentParser()
	parser.add_argument(
		"--check-only",
		action="store_true",
		help="report stale registered sources without changing the repository",
	)
	args = parser.parse_args()

	stale, missing = stale_sources()
	if missing:
		print("knowledge pre-push: registered sources are missing:", file=sys.stderr)
		for path in missing:
			print(f"  {path}", file=sys.stderr)
		return 1

	if args.check_only:
		if stale:
			print("knowledge pre-push: stale registered sources:")
			for path in stale:
				print(f"  {path}")
			return 1
		print("knowledge pre-push: registered source hashes are current")
		return 0

	if not stale and knowledge_check():
		print("knowledge pre-push: knowledge graph and static export are current")
		return 0

	require_clean_worktree()
	require_kgdistiller()
	created_commits = False

	graph_check = run(
		"kgdistiller",
		"--repo-root",
		str(REPOSITORY_ROOT),
		"check",
		check=False,
		capture=True,
	)
	if stale or (
		graph_check.returncode != 0
		and "stale graph artifacts" in graph_check.stderr
	):
		sync_registered_sources()
		created_commits = True
	elif graph_check.returncode != 0:
		print(
			"knowledge pre-push: private knowledge state is invalid and cannot be auto-repaired safely.",
			file=sys.stderr,
		)
		return 1

	if not knowledge_check():
		refresh_export()
		created_commits = True

	if not knowledge_check():
		print("knowledge pre-push: repair completed but validation still fails.", file=sys.stderr)
		return 1

	if created_commits:
		print(
			"knowledge pre-push: created knowledge commits. The original push was stopped because Git had already selected its commit; run git push again.",
			file=sys.stderr,
		)
		return 1

	return 0


if __name__ == "__main__":
	raise SystemExit(main())
