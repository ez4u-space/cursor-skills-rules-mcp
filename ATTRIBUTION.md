# Авторы и оригиналы

Этот пак **не содержит** копий skills. Ниже — источники, откуда Skills CLI / marketplace ставят пакеты. Уважайте лицензии upstream.

## Agent skills

| Skill | Автор / организация | Оригинал | Лицензия (как заявлено) |
|---|---|---|---|
| hallmark | nutlope (Hassan El Mghari) / Together AI | https://github.com/nutlope/hallmark | см. репозиторий |
| find-skills | Vercel Labs | https://github.com/vercel-labs/skills | см. репозиторий |
| vercel-react-best-practices | Vercel | https://github.com/vercel-labs/agent-skills | MIT |
| vercel-composition-patterns | Vercel | https://github.com/vercel-labs/agent-skills | MIT |
| web-design-guidelines | Vercel Labs | https://github.com/vercel-labs/agent-skills | см. репозиторий |
| deploy-to-vercel | Vercel Labs | https://github.com/vercel-labs/agent-skills | см. репозиторий |
| frontend-design | Anthropic | https://github.com/anthropics/skills | Apache-2.0 |
| skill-creator | Anthropic | https://github.com/anthropics/skills | Apache-2.0 |
| pdf | Anthropic | https://github.com/anthropics/skills | условия Anthropic (не переиздавать) |
| docx | Anthropic | https://github.com/anthropics/skills | условия Anthropic (не переиздавать) |
| pptx | Anthropic | https://github.com/anthropics/skills | условия Anthropic (не переиздавать) |
| xlsx | Anthropic | https://github.com/anthropics/skills | условия Anthropic (не переиздавать) |
| doc-coauthoring | Anthropic | https://github.com/anthropics/skills | Apache-2.0 |
| webapp-testing | Anthropic | https://github.com/anthropics/skills | Apache-2.0 |
| mcp-builder | Anthropic | https://github.com/anthropics/skills | Apache-2.0 |
| canvas-design | Anthropic | https://github.com/anthropics/skills | Apache-2.0 |
| web-artifacts-builder | Anthropic | https://github.com/anthropics/skills | Apache-2.0 |
| theme-factory | Anthropic | https://github.com/anthropics/skills | Apache-2.0 |
| gh-fix-ci | OpenAI | https://github.com/openai/skills | см. репозиторий |
| security-best-practices | OpenAI | https://github.com/openai/skills | см. репозиторий |
| security-threat-model | OpenAI | https://github.com/openai/skills | см. репозиторий |
| playwright | OpenAI | https://github.com/openai/skills | см. репозиторий |
| gh-address-comments | OpenAI | https://github.com/openai/skills | см. репозиторий |
| yeet | OpenAI | https://github.com/openai/skills | см. репозиторий |
| tdd | Matt Pocock | https://github.com/mattpocock/skills | см. репозиторий |
| systematic-debugging | Jesse Vincent (obra) | https://github.com/obra/superpowers | MIT |
| ui-ux-pro-max | nextlevelbuilder | https://github.com/nextlevelbuilder/ui-ux-pro-max-skill | см. репозиторий |
| lobehub-skills-search-engine | LobeHub | LobeHub Skills Marketplace / `@lobehub/market-cli` | условия LobeHub |

Каталог поиска skills: https://skills.sh/

## Cursor plugins

| Plugin | Автор | Оригинал / docs | Лицензия |
|---|---|---|---|
| Superpowers | Jesse Vincent / obra | https://github.com/obra/superpowers · [Install on Cursor](https://obra-superpowers.mintlify.app/installation/cursor) | MIT |

## Что сознательно не включено

- **Figma** и **Supabase** Cursor-плагины — опциональны и часто нужны только под конкретные проекты.
- Встроенные skills Cursor (`create-rule`, `canvas`, ...) — поставляются с Cursor.
- Личные VS Code/Cursor extensions.
- Узконишевые каталоги (finance, life sciences, Zoom SDK и т.п.).

## Rules (в package/rules/)

| Файл | Источник |
|---|---|
| `ez4u-elite-agent-prompt.md` | Локальный ez4u role prompt |
| `00-*.mdc` … `40-*.mdc` | Cursor User Rules / предпочтения пака |

## MCP (в package/mcp/)

Шаблон без секретов (`${env:GITHUB_PAT}`). Гайд: `MCP_GUIDE.md`.  
Серверы: filesystem, memory, sequential-thinking, playwright, github (remote), context7, chrome-devtools.

## Как собран список

Skills — по `~/.agents/.skill-lock.json` и marketplace; в git только манифест и attribution, **без** копий skills.  
Rules и MCP — собственные файлы пака в `package/`.
