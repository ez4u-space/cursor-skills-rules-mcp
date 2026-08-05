# Инструкция для ИИ-агента: Skills + Rules + MCP

Репозиторий: https://github.com/ez4u-space/cursor-skills-rules-mcp

Это **каталог**, не архив skills. Чужие `SKILL.md` **не** копируй из git и **не** коммить обратно. Skills ставь **из оригиналов** по `manifest/skills.json`. Rules и MCP — из `package/`.

## Когда запускать

Пользователь просит установить пак / skills+rules+mcp / дал ссылку на этот репозиторий.

## Протокол

### 0. Достань репо

Если workspace не этот репо — clone или читай сырые файлы с GitHub:

- `AGENTS.md`, `manifest/skills.json`, `manifest/plugins.json`
- `package/rules/*`, `package/mcp/mcp.example.json`

### 1. Skills

1. Проверь Node/`npx`.
2. Для каждой записи в `manifest/skills.json` с `required: true` выполни поле `install`.
3. При ошибке — зафиксируй и продолжай.
4. Не вендори skills в git.

### 2. Rules

Скопируй `package/rules/*` → `~/.cursor/rules/` (создай каталог при необходимости).

### 3. MCP

1. Если есть `~/.cursor/mcp.json` — сделай backup.
2. Запиши `package/mcp/mcp.example.json` в `~/.cursor/mcp.json`, подставив username/HOME.
3. **Никогда** не вставляй PAT/ключи в файл — только `${env:GITHUB_PAT}`.
4. Скопируй `package/mcp/MCP_GUIDE.md` → `~/.cursor/MCP_GUIDE.md`.

Альтернатива: запусти `install.ps1` / `install.sh` из корня репо.

### 4. Superpowers

Попроси пользователя: `/add-plugin superpowers` в Agent-чате, дождись подтверждения.

### 5. Отчёт

| компонент | статус |
|---|---|
| skills (по id) | ok / fail |
| rules | ok / fail |
| mcp | ok / fail |
| Superpowers | waiting user |

Напомни перезапуск Cursor и `GITHUB_PAT`.

## Чего не делать

- Не копировать skills из репо в `~/.agents/skills` (их там нет — только манифест).
- Не создавать `package/skills/` и не коммитить чужие skills.
- Не ставить Figma/Supabase/личные extensions.
- Не печатать и не коммитить секреты.
