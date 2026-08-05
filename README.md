# Cursor Skills + Rules + MCP

Каталог для воспроизводимой установки сетапа Cursor:

- **Skills** — только из **оригинальных** источников (`npx skills add …`), без копий в git  
- **Rules** — ваши `.mdc` / prompt в `package/rules/`  
- **MCP** — шаблон `package/mcp/mcp.example.json` + гайд  

Репозиторий: https://github.com/ez4u-space/cursor-skills-rules-mcp

## Установка через ИИ

```text
Установи мне пак из https://github.com/ez4u-space/cursor-skills-rules-mcp — следуй AGENTS.md
```

Или если репо уже открыто:

```text
Прочитай AGENTS.md и установи skills, rules и MCP по манифестам и package/
```

## Установка скриптом

```powershell
git clone https://github.com/ez4u-space/cursor-skills-rules-mcp.git
cd cursor-skills-rules-mcp
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

```bash
git clone https://github.com/ez4u-space/cursor-skills-rules-mcp.git
cd cursor-skills-rules-mcp
chmod +x install.sh && ./install.sh
```

После установки перезапустите Cursor. Для GitHub MCP задайте `GITHUB_PAT`.  
Superpowers: в Agent-чате `/add-plugin superpowers`.

## Структура

| Путь | Роль |
|---|---|
| `manifest/skills.json` | Список skills + команды `install` |
| `manifest/plugins.json` | Superpowers |
| `package/rules/` | Cursor rules → `~/.cursor/rules/` |
| `package/mcp/` | Пример MCP + гайд |
| `AGENTS.md` | Протокол для ИИ-агента |
| `install.ps1` / `install.sh` | Установщики |

**Запрещено класть в git:** папки чужих skills (`package/skills/` в `.gitignore`).

## Обновление (мейнтейнер)

1. Добавил skill локально → запись в `manifest/skills.json` + строка в `ATTRIBUTION.md`.  
2. Rules/MCP → правь `package/rules` / `package/mcp`.  
3. Commit + push. Skills файлами не коммитить.

## Авторы

[ATTRIBUTION.md](./ATTRIBUTION.md)
