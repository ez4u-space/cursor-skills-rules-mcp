# Установка Skills (npx) + Rules + MCP — Windows
# Skills НЕ копируются из git — только из оригиналов по manifest/skills.json

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $PSScriptRoot
if (-not (Test-Path (Join-Path $Root "manifest\skills.json"))) {
  $Root = $PSScriptRoot
}
if (-not (Test-Path (Join-Path $Root "manifest\skills.json"))) {
  throw "Не найден manifest/skills.json. Запускайте из клона репозитория."
}

Write-Host "==> Skills из manifest (npx / lobehub)"
$manifest = Get-Content (Join-Path $Root "manifest\skills.json") -Raw -Encoding UTF8 | ConvertFrom-Json
$ok = 0; $fail = 0
foreach ($skill in $manifest.skills) {
  if ($skill.required -eq $false) { continue }
  Write-Host "  $($skill.id): $($skill.install)"
  try {
    Invoke-Expression $skill.install
    if ($LASTEXITCODE -ne 0 -and $null -ne $LASTEXITCODE) { throw "exit $LASTEXITCODE" }
    $ok++
  } catch {
    Write-Warning "FAIL $($skill.id): $_"
    $fail++
  }
}
Write-Host "  skills: ok=$ok fail=$fail"

$CursorRules = Join-Path $env:USERPROFILE ".cursor\rules"
$RulesSrc = Join-Path $Root "package\rules"
if (Test-Path $RulesSrc) {
  Write-Host "==> Rules → $CursorRules"
  New-Item -ItemType Directory -Force -Path $CursorRules | Out-Null
  Copy-Item (Join-Path $RulesSrc "*") $CursorRules -Force
}

$McpExample = Join-Path $Root "package\mcp\mcp.example.json"
$McpTarget = Join-Path $env:USERPROFILE ".cursor\mcp.json"
if (Test-Path $McpExample) {
  Write-Host "==> MCP → $McpTarget"
  if (Test-Path $McpTarget) {
    $bak = "$McpTarget.bak-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Copy-Item $McpTarget $bak -Force
    Write-Host "  backup: $bak"
  }
  $text = (Get-Content $McpExample -Raw -Encoding UTF8).Replace("YOUR_WINDOWS_USERNAME", $env:USERNAME)
  Set-Content -Path $McpTarget -Value $text -Encoding UTF8
  $guide = Join-Path $Root "package\mcp\MCP_GUIDE.md"
  if (Test-Path $guide) {
    Copy-Item $guide (Join-Path $env:USERPROFILE ".cursor\MCP_GUIDE.md") -Force
  }
}

Write-Host ""
Write-Host "Готово. Перезапустите Cursor."
Write-Host "Superpowers: в Agent-чате /add-plugin superpowers"
Write-Host "GitHub MCP: env GITHUB_PAT (см. package/mcp/MCP_GUIDE.md)"
