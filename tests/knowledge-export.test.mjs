import assert from "node:assert/strict";
import { createHash } from "node:crypto";
import { existsSync, readFileSync } from "node:fs";
import { dirname, relative, resolve } from "node:path";
import test from "node:test";
import { fileURLToPath } from "node:url";

const repositoryRoot = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const knowledgeRoot = resolve(repositoryRoot, "knowledge");
const privateGraphRoot = resolve(knowledgeRoot, "graph");
const exportRoot = resolve(knowledgeRoot, "export/site");

function readJson(path) {
	return JSON.parse(readFileSync(path, "utf8"));
}

function readJsonLines(path) {
	const text = canonicalText(readFileSync(path, "utf8"));
	return {
		text,
		records: text
			.split("\n")
			.filter(Boolean)
			.map((line) => JSON.parse(line)),
	};
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

test("the private graph and current sources still match the adopted export input", () => {
	const exportManifest = readJson(resolve(exportRoot, "manifest.json"));
	const graphManifest = readJson(resolve(privateGraphRoot, "manifest.json"));
	assert.equal(graphManifest.schema, exportManifest.graph.private_schema);
	assert.equal(graphManifest.graph_sha256, exportManifest.graph.private_sha256);
	assert.deepEqual(graphManifest.counts, exportManifest.graph.private_counts);

	const nodes = readJsonLines(resolve(privateGraphRoot, "nodes.jsonl"));
	const edges = readJsonLines(resolve(privateGraphRoot, "edges.jsonl"));
	const references = readJsonLines(resolve(privateGraphRoot, "references.jsonl"));
	assert.equal(nodes.records.length, graphManifest.counts.nodes);
	assert.equal(edges.records.length, graphManifest.counts.edges);
	assert.equal(references.records.length, graphManifest.counts.references);

	let digestInput = nodes.text + edges.text + references.text;
	let entryCount = 0;
	const shardPaths = [];
	for (const shard of graphManifest.entry_store.shards) {
		const shardPath = resolveInside(privateGraphRoot, shard.path);
		const content = canonicalTextBytes(shardPath);
		const text = content.toString("utf8");
		const records = text.split("\n").filter(Boolean).map((line) => JSON.parse(line));
		assert.equal(content.byteLength, shard.bytes, `byte count: ${shard.path}`);
		assert.equal(records.length, shard.count, `record count: ${shard.path}`);
		assert.equal(sha256(content), shard.sha256, `digest: ${shard.path}`);
		entryCount += records.length;
		shardPaths.push(shard.path);
	}
	assert.deepEqual(shardPaths, [...shardPaths].sort());
	assert.equal(entryCount, graphManifest.entry_store.entries);
	for (const shardPath of shardPaths) {
		digestInput +=
			shardPath + canonicalText(
				readFileSync(resolveInside(privateGraphRoot, shardPath), "utf8"),
			);
	}

	// kgdistiller 0.4 binds the entry Markdown inventory into the graph digest:
	// entry_authorities first, then entry_sources, each contributing path+digest
	// rather than file content. Both are repository-relative authorities.
	for (const section of [
		graphManifest.entry_authorities,
		graphManifest.entry_sources,
	]) {
		const paths = section.entries.map((entry) => entry.path);
		assert.deepEqual(paths, [...paths].sort());
		for (const entry of section.entries) {
			const path = resolveInside(repositoryRoot, entry.path);
			assert.equal(existsSync(path), true, `missing entry authority: ${entry.path}`);
			assert.equal(
				sha256(canonicalTextBytes(path)),
				entry.sha256,
				`stale entry authority: ${entry.path}`,
			);
			digestInput += entry.path + entry.sha256;
		}
	}
	assert.equal(sha256(digestInput), graphManifest.graph_sha256);

	for (const [authority, expected] of Object.entries(graphManifest.source_hashes)) {
		const sourcePath = resolveInside(repositoryRoot, authority);
		assert.equal(existsSync(sourcePath), true, `missing source: ${authority}`);
		assert.equal(sha256(canonicalTextBytes(sourcePath)), expected, `stale source: ${authority}`);
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
