---
name: deepwiki
description: Research any public GitHub repository's documentation using DeepWiki. Use when you need to understand how a library, tool, or framework works — its architecture, API, configuration, or internals — without reading raw source code.
---

# DeepWiki Research Skill

## Overview

DeepWiki is an AI-generated documentation layer over public GitHub repositories. It provides structured wikis, architecture summaries, and a question-answering interface for any indexed repo — accessible via a zero-auth REST API.

**Base URL**: `https://api.deepwiki.com/wiki/{owner}/{repo}`

**URL pattern**: `deepwiki.com/owner/repo` mirrors `github.com/owner/repo` — swap the domain, get the wiki.

---

## When to Use This Skill

- You need to understand how an unfamiliar library or tool works before using or integrating it.
- You are debugging an issue and need to understand the internals of a dependency.
- Noir needs architectural context to write an accurate implementation contract.
- Ripley needs to know the exact API shape of a third-party library before implementing against it.
- Holmes needs to verify whether an implementation aligns with a library's intended usage patterns.

**Do not use** for: runtime behavior, environment-specific quirks, private repos, or GitHub Issues/PRs — DeepWiki does not cover these.

---

## API Reference

### 1. Get Wiki Structure (Table of Contents)
Retrieve the topic hierarchy for a repo. Always start here to understand what documentation is available before fetching content.

```bash
curl -s "https://api.deepwiki.com/wiki/{owner}/{repo}/structure" \
  -H "Accept: application/json"
```

**Example:**
```bash
curl -s "https://api.deepwiki.com/wiki/ollama/ollama/structure" \
  -H "Accept: application/json"
```

---

### 2. Get Full Wiki Contents
Fetch the complete documentation for a repo in one call. Use when you need a broad understanding of the entire project.

```bash
curl -s "https://api.deepwiki.com/wiki/{owner}/{repo}/contents" \
  -H "Accept: application/json"
```

**Example:**
```bash
curl -s "https://api.deepwiki.com/wiki/caddyserver/caddy/contents" \
  -H "Accept: application/json"
```

---

### 3. Ask a Question (Targeted Research)
Ask a specific natural language question about a repo. Use when you need a focused answer rather than full docs. Most efficient for targeted research.

```bash
curl -s -X POST "https://api.deepwiki.com/wiki/{owner}/{repo}/ask" \
  -H "Content-Type: application/json" \
  -d '{"question": "Your question here"}'
```

**Example:**
```bash
curl -s -X POST "https://api.deepwiki.com/wiki/ollama/ollama/ask" \
  -H "Content-Type: application/json" \
  -d '{"question": "How does Ollama handle model context window allocation?"}'
```

To extract just the answer:
```bash
curl -s -X POST "https://api.deepwiki.com/wiki/{owner}/{repo}/ask" \
  -H "Content-Type: application/json" \
  -d '{"question": "..."}' | jq '.answer'
```

To get the answer with sources:
```bash
... | jq '{answer, sources}'
```

---

## Recommended Workflow

For most research tasks, follow this sequence:

```
1. Get structure  →  understand what topics exist
2. Ask questions  →  targeted answers on specific topics
3. Get contents   →  only if broad full-doc context is needed
```

**Think before fetching full contents** — it can be large. Prefer `ask` for specific questions; reserve `contents` for when you need a complete architectural picture.

---

## Resolving owner/repo from a Library Name

If you know the library name but not the GitHub owner/repo, resolve it first:

```bash
# Search GitHub to find the canonical repo
curl -s "https://api.github.com/search/repositories?q={library_name}&sort=stars&per_page=1" \
  | jq '.items[0] | {full_name, html_url, description}'
```

Then use the `full_name` (e.g. `ollama/ollama`) as your `{owner}/{repo}`.

---

## Practical Examples

**Research how Caddy handles TLS internally:**
```bash
curl -s -X POST "https://api.deepwiki.com/wiki/caddyserver/caddy/ask" \
  -H "Content-Type: application/json" \
  -d '{"question": "How does Caddy manage TLS certificate provisioning and renewal?"}' \
  | jq '.answer'
```

**Understand Podman Quadlet file structure:**
```bash
curl -s -X POST "https://api.deepwiki.com/wiki/containers/podman/ask" \
  -H "Content-Type: application/json" \
  -d '{"question": "How do Quadlet .container unit files work and what fields are supported?"}' \
  | jq '.answer'
```

**Get the full structure of the Hyprland wiki before diving in:**
```bash
curl -s "https://api.deepwiki.com/wiki/hyprwm/Hyprland/structure" \
  -H "Accept: application/json" | jq '.'
```

---

## Notes

- No API key or authentication required for public repositories.
- If a repo is not yet indexed, visit `deepwiki.com/owner/repo` to trigger indexing.
- DeepWiki explains structure and logic — not runtime behavior or test coverage.
- Content is AI-generated; verify critical implementation details against source when precision matters.
