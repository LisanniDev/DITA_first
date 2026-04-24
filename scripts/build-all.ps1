[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
. "$PSScriptRoot/utils.ps1"

$maps = Get-ChildItem "$PSScriptRoot/../maps" -Filter "main-*.ditamap"

foreach ($map in $maps) {
    $mapPath = $map.FullName
    $mapName = $map.BaseName

    Write-Host "=== Building $mapName ==="

    $keys = Get-KeysForMap $mapName
    $fileName = Get-FileName $keys

    $tempDir = "$PSScriptRoot/../out/tmp_$mapName"

    $DITA = "C:\dita-ot-4.4\bin\dita.bat"
    & $DITA -i $mapPath -f pdf -o $tempDir

    $pdf = Get-ChildItem $tempDir -Filter *.pdf | Select-Object -First 1

    if (-not $pdf) {
        throw "PDF not generated for $mapName"
    }

    Move-Item $pdf.FullName "$PSScriptRoot/../out/$fileName" -Force
    Remove-Item $tempDir -Recurse -Force
}