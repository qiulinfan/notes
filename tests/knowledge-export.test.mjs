import assert from "node:assert/strict";
import { createHash } from "node:crypto";
import { existsSync, readFileSync } from "node:fs";
import { dirname, relative, resolve } from "node:path";
import test from "node:test";
import { fileURLToPath } from "node:url";

const repositoryRoot = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const knowledgeRoot = resolve(repositoryRoot, ".knowledge");
const exportRoot = resolve(knowledgeRoot, "export/site");

function readJson(path) {
	return JSON.parse(readFileSync(path, "utf8"));
}

function canonicalText(value) {
	return value.replace(/\r\n?/g, "\n");
}

function canonicalTextBytes(path) {
	return Buffer.from(canonicalText(readFileSync(path, "utf8")), "utf8");
}

function sha256(content) {
	return createHash("sha256").update(content).digest("hex");
}

function resolveInside(root, relativePath) {
	assert.equal(typeof relativePath, "string");
	assert.notEqual(relativePath, "");
	const path = resolve(root, relativePath);
	const offset = relative(root, path);
	assert.equal(offset.startsWith("..") || resolve(offset) === offset, false);
	return path;
}

test("the committed site bundle records one selected kgdistiller product revision", () => {
	const manifest = readJson(resolve(exportRoot, "manifest.json"));
	assert.equal(manifest.schema, "kgdistiller-static-export-v1");
	assert.equal(manifest.producer.name, "kgdistiller");
	assert.equal(
		manifest.producer.repository,
		"https://github.com/qiulinfan/kgdistiller",
	);
	assert.match(manifest.producer.version, /^\d+\.\d+\.\d+(?:[-+].+)?$/);
	assert.match(manifest.producer.commit, /^(?:[a-f0-9]{40}|[a-f0-9]{64})$/);
	assert.equal(
		manifest.source.repository,
		"https://github.com/qiulinfan/notes",
	);
	assert.match(manifest.source.revision, /^[a-f0-9]{40}$/);
	assert.equal(manifest.visibility.policy, "explicit-publish");
	assert.match(manifest.export_sha256, /^[a-f0-9]{64}$/);

	const artifacts = new Map(
		manifest.artifacts.map((artifact) => [artifact.path, artifact]),
	);
	for (const path of ["graph.json", "knowledge-registry.typ", "verify_export.py"]) {
		const artifact = artifacts.get(path);
		assert.ok(artifact, `unrecorded export artifact: ${path}`);
		const content = canonicalTextBytes(resolveInside(exportRoot, path));
		assert.equal(content.byteLength, artifact.bytes, `byte count: ${path}`);
		assert.equal(sha256(content), artifact.sha256, `digest: ${path}`);
	}
});

test("the adopted export still matches its published sources and entry authorities", () => {
	const manifest = readJson(resolve(exportRoot, "manifest.json"));
	const graph = readJson(resolve(exportRoot, "graph.json"));
	// Publication consumes this pinned bundle, not the private graph's physical
	// storage layout. Keep checking its actual inputs across storage compaction.
	for (const [authority, expected] of Object.entries(manifest.source.published_hashes)) {
		const path = resolveInside(repositoryRoot, authority);
		assert.equal(existsSync(path), true, `missing published source: ${authority}`);
		assert.equal(sha256(canonicalTextBytes(path)), expected, `stale published source: ${authority}`);
	}
	for (const node of graph.nodes) {
		const properties = node.properties ?? {};
		for (const [pathKey, digestKey] of [
			["entry_authority", "entry_sha256"],
			["entry_source", "entry_source_current_sha256"],
		]) {
			const authority = properties[pathKey];
			if (!authority) continue;
			// The adopted bundle pins the pre-migration source revision. Resolve its
			// old knowledge prefix into the current tree without changing the bundle.
			const migrated = authority.startsWith("knowledge/");
			const path = resolveInside(repositoryRoot, migrated ? `.${authority}` : authority);
			assert.equal(existsSync(path), true, `missing published evidence: ${authority}`);
			assert.match(properties[digestKey], /^[a-f0-9]{64}$/);
			let content = canonicalText(readFileSync(path, "utf8"));
			if (migrated && pathKey === "entry_authority") {
				// Only the source-location frontmatter changed. Undo that one path
				// edit to verify the exact historical entry bytes, including its body.
				content = content.replace(/^(kgd_source: "?)\.knowledge\//m, "$1knowledge/");
			}
			assert.equal(sha256(Buffer.from(content, "utf8")), properties[digestKey], `stale published evidence: ${authority}`);
		}
	}
});

test("the public graph is self-contained and contains only published sources", () => {
	const manifest = readJson(resolve(exportRoot, "manifest.json"));
	const graph = readJson(resolve(exportRoot, "graph.json"));
	assert.equal(graph.schema, "kgdistiller-site-graph-v1");
	assert.equal(graph.namespace, "public");
	assert.equal(graph.source_graph_sha256, manifest.graph.private_sha256);
	assert.equal(graph.graph_sha256, manifest.graph.public_sha256);
	assert.deepEqual(graph.counts, manifest.graph.public_counts);
	assert.equal(graph.nodes.length, graph.counts.nodes);
	assert.equal(graph.edges.length, graph.counts.edges);
	assert.equal(graph.references.length, graph.counts.references);

	const ids = new Set(graph.nodes.map((node) => String(node.id)));
	assert.equal(ids.size, graph.nodes.length);
	assert.equal(ids.has("computer-organization"), false);
	assert.equal(ids.has("computer-architecture"), false);
	assert.equal(
		graph.edges.every(
			(edge) => ids.has(String(edge.source)) && ids.has(String(edge.target)),
		),
		true,
	);
	assert.equal(
		graph.references.every((reference) => ids.has(String(reference.target))),
		true,
	);
	assert.equal(
		graph.nodes.every((node) => !(node.properties ?? {}).entry_path),
		true,
	);
});
