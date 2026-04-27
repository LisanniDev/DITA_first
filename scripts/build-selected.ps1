$mapsString = $args[1]
if (-not $mapsString) {
    throw "No models provided. Usage: build-selected.ps1 <model1,model2,...>"
}

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
. "$PSScriptRoot/utils.ps1"

$DITA = "C:\dita-ot\bin\dita.bat"
$PLUGIN_PATH = Resolve-Path "$PSScriptRoot/../plugins"

# разбиваем строку и нормализуем имена
$maps = $mapsString -split "," | ForEach-Object {
    $m = $_.Trim()

    if ($m -notmatch "^main-") {
        $m = "main-$m"
    }

    return $m
}

foreach ($m in $maps) {
    $mapPath = "$PSScriptRoot/../maps/$m.ditamap"

    if (-not (Test-Path $mapPath)) {
        Write-Warning "Map not found: $m"
        continue
    }

    Write-Host "=== Building $m ==="

    $keys = Get-KeysForMap $m
    $fileName = Get-FileName $keys

    $tempDir = "$PSScriptRoot/../out/tmp_$m"

    # путь к DITA-OT (проверь свой)
    $DITA = "C:\dita-ot\bin\dita.bat"

    if (-not (Test-Path $DITA)) {
        throw "DITA-OT not found at $DITA"
    }

    & $DITA -i $mapPath -f pdf2 -o $tempDir -Dargs.plugin.path="$PLUGIN_PATH"

    $pdf = Get-ChildItem $tempDir -Filter *.pdf | Select-Object -First 1

    if (-not $pdf) {
        throw "PDF not generated for $m"
    }

    Move-Item $pdf.FullName "$PSScriptRoot/../out/$fileName" -Force
    Remove-Item $tempDir -Recurse -Force
}