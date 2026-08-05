#!/usr/bin/env bash
set -euo pipefail
# Skills — только из оригиналов по manifest; rules/mcp — из package/

ROOT="$(cd "$(dirname "$0")" && pwd)"
if [[ ! -f "$ROOT/manifest/skills.json" ]]; then
  echo "Не найден manifest/skills.json" >&2
  exit 1
fi

echo "==> Skills из manifest (npx)"
ok=0; fail=0
# portable JSON loop via python
while IFS= read -r cmd; do
  [[ -z "$cmd" ]] && continue
  echo "  $cmd"
  if bash -lc "$cmd"; then
    ok=$((ok+1))
  else
    echo "WARN: failed: $cmd" >&2
    fail=$((fail+1))
  fi
done < <(python3 - <<'PY' "$ROOT/manifest/skills.json"
import json, sys
data = json.load(open(sys.argv[1], encoding="utf-8"))
for s in data.get("skills", []):
    if s.get("required") is False:
        continue
    print(s["install"])
PY
)
echo "  skills: ok=$ok fail=$fail"

RULES_SRC="$ROOT/package/rules"
CURSOR_RULES="${HOME}/.cursor/rules"
if [[ -d "$RULES_SRC" ]]; then
  echo "==> Rules → ${CURSOR_RULES}"
  mkdir -p "${CURSOR_RULES}"
  cp -f "$RULES_SRC"/* "${CURSOR_RULES}/"
fi

MCP_EXAMPLE="$ROOT/package/mcp/mcp.example.json"
MCP_TARGET="${HOME}/.cursor/mcp.json"
if [[ -f "$MCP_EXAMPLE" ]]; then
  echo "==> MCP → ${MCP_TARGET}"
  if [[ -f "$MCP_TARGET" ]]; then
    bak="${MCP_TARGET}.bak-$(date +%Y%m%d-%H%M%S)"
    cp "$MCP_TARGET" "$bak"
    echo "  backup: $bak"
  fi
  python3 - <<'PY' "$MCP_EXAMPLE" "$MCP_TARGET" "$HOME"
import json, sys
src, dst, home = sys.argv[1], sys.argv[2], sys.argv[3]
data = json.load(open(src, encoding="utf-8"))
# unix: упростить cmd /c обёртки
for name, srv in list(data.get("mcpServers", {}).items()):
    if srv.get("command") == "cmd":
        args = srv.get("args") or []
        if len(args) >= 4 and args[0] == "/c" and args[1] == "npx":
            srv["command"] = "npx"
            srv["args"] = args[2:]
    if name == "filesystem":
        data["mcpServers"]["filesystem"] = {
            "command": "npx",
            "args": ["-y", "@modelcontextprotocol/server-filesystem", home],
        }
with open(dst, "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)
    f.write("\n")
print("  wrote", dst)
PY
  [[ -f "$ROOT/package/mcp/MCP_GUIDE.md" ]] && cp -f "$ROOT/package/mcp/MCP_GUIDE.md" "${HOME}/.cursor/MCP_GUIDE.md"
fi

echo
echo "Готово. Перезапустите Cursor."
echo "Superpowers: /add-plugin superpowers"
echo "GitHub MCP: export GITHUB_PAT=..."
