$mapsString = $args[1]
if (-not $mapsString) {
    throw "No models provided. Usage: build-selected.ps1 <model1,model2,...>"
}

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
. "$PSScriptRoot/utils.ps1"

$projectRoot = Resolve-Path "$PSScriptRoot/.."
$DITA = "$projectRoot/dita-ot/bin/dita.bat"

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

    if (-not (Test-Path $DITA)) {
        throw "DITA-OT not found at $DITA"
    }

    & $DITA -i $mapPath -f pdf2 -o $tempDir -v

    $pdf = Get-ChildItem $tempDir -Filter *.pdf | Select-Object -First 1

    if (-not $pdf) {
        throw "PDF not generated for $m"
    }

    Move-Item $pdf.FullName "$PSScriptRoot/../out/$fileName" -Force
    #Remove-Item $tempDir -Recurse -Force
}