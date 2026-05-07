param (
    [string]$PluginName = "org.graviton.ps-pdf"
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# корень проекта
$projectRoot = Resolve-Path "$PSScriptRoot/.."

# пути
$DITA = "$projectRoot/dita-ot/bin/dita.bat"
$pluginSource = "$projectRoot/plugins/$PluginName"
$pluginTarget = "$projectRoot/dita-ot/plugins/$PluginName"

# проверки
if (-not (Test-Path $DITA)) {
    throw "DITA-OT not found at $DITA"
}

if (-not (Test-Path $pluginSource)) {
    throw "Plugin source not found at $pluginSource"
}

Write-Host "=== Reinstalling plugin: $PluginName ==="

# 1. удалить старый плагин
if (Test-Path $pluginTarget) {
    Write-Host "Removing existing plugin..."
    Remove-Item $pluginTarget -Recurse -Force
}

# 2. копировать новый
# Write-Host "Copying plugin..."
# Copy-Item $pluginSource $pluginTarget -Recurse -Force

# 3. интеграция плагинов
Write-Host "Running DITA integration..."
& $DITA install --install $pluginSource
# & $DITA --clean

if ($LASTEXITCODE -ne 0) {
    throw "DITA integration failed"
}

Write-Host "=== Plugin $PluginName installed successfully ==="