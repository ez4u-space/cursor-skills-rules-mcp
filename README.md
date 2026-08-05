# Cursor Skills Pack

Каталог публичных **agent skills** (и одного полезного плагина) для воспроизводимой установки из **оригинальных** источников, без копирования чужих файлов в git.

## Как поставить (через ИИ в Cursor)

### Вариант A — только ссылка (удобнее всего)

В любом Agent-чате Cursor вставь:

```text
Установи мне скиллы из https://github.com/ez4u-space/cursor-skills-pack — следуй AGENTS.md в том репо.
```

Агент сам достанет `AGENTS.md` и манифесты (clone или чтение с GitHub) и поставит skills из **оригинальных** источников. Репозиторий заранее открывать не обязательно.

### Вариант B — репо уже открыто в Cursor

```text
Прочитай AGENTS.md и установи все skills и плагины по манифестам.
```

### После установки

1. Дождись отчёта агента.
2. Для **Superpowers** выполни в Agent-чате `/add-plugin superpowers` (или Marketplace), когда агент попросит, и подтверди.
3. При необходимости перезапусти Cursor.

## Что ставится

- Skills из `manifest/skills.json` — через `npx skills add ...` (и LobeHub CLI для одного пакета).
- Плагин **Superpowers** из `manifest/plugins.json`.

**Не входит:** Figma, Supabase, личные VS Code-расширения, встроенные skills Cursor.

Подробности и авторы: [ATTRIBUTION.md](./ATTRIBUTION.md).  
Протокол для агента: [AGENTS.md](./AGENTS.md).

## Требования

- [Cursor](https://cursor.com/)
- [Node.js](https://nodejs.org/) (чтобы работал `npx`)

## Обновление списка

Если на своей машине добавил/убрал публичный skill:

1. Обнови `manifest/skills.json` (или `plugins.json`).
2. Обнови `ATTRIBUTION.md`.
3. Закоммить и запушь.

Не клади содержимое skills в репозиторий — только манифест и ссылки на оригинал.

## Лицензии

Этот репозиторий содержит **только** инструкции и метаданные.  
Каждый skill/плагин распространяется на условиях **своего** upstream (см. ATTRIBUTION). Skills Anthropic (`pdf`, `docx`, `pptx`, `xlsx`, design/MCP и др.) и OpenAI (`gh-fix-ci`, security, `playwright` и др.) устанавливаются пользователем напрямую из [anthropics/skills](https://github.com/anthropics/skills) и [openai/skills](https://github.com/openai/skills); мы их не переиздаём.
