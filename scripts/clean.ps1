Write-Host "Cleaning output..."

Remove-Item "$PSScriptRoot/../out/*.pdf" -Force -ErrorAction SilentlyContinue
Remove-Item "$PSScriptRoot/../out/tmp_*" -Recurse -Force -ErrorAction SilentlyContinue