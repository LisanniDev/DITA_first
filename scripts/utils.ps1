function Get-KeysFromDitamap($filePath) {
    [xml]$xml = Get-Content $filePath -Encoding UTF8

    $keys = @{}

    $xml.SelectNodes("//keydef") | ForEach-Object {
        $keyName = $_.keys
        $keywordNode = $_.SelectSingleNode(".//keyword")

        if ($keywordNode) {
            $value = $keywordNode.'#text'

            if ($keyName -and $value) {
                $keys[$keyName] = $value
            }
        }
    }

    return $keys
}

function Merge-Keys($baseKeys, $modelKeys) {
    $result = @{}

    # сначала base
    foreach ($k in $baseKeys.Keys) {
        $result[$k] = $baseKeys[$k]
    }

    # потом override
    foreach ($k in $modelKeys.Keys) {
        $result[$k] = $modelKeys[$k]
    }

    return $result
}

function Get-KeysForMap($mapName) {
    $keysDir = "$PSScriptRoot/../keys"

    # 1. base
    $basePath = Join-Path $keysDir "keys-base.ditamap"

    if (-not (Test-Path $basePath)) {
        throw "keys-base.ditamap not found!"
    }

    $baseKeys = Get-KeysFromDitamap $basePath

    # 2. модель (XXX)
    if ($mapName -match "main-(.+)") {
        $modelId = $Matches[1]
    } else {
        throw "Cannot extract model id from map: $mapName"
    }

    $modelPath = Join-Path $keysDir "keys-$modelId.ditamap"

    if (-not (Test-Path $modelPath)) {
        throw "Model keys not found: keys-$modelId.ditamap"
    }

    $modelKeys = Get-KeysFromDitamap $modelPath

    # 3. merge
    return Merge-Keys $baseKeys $modelKeys
}

function Get-FileName($keys) {
    $code_product = $keys["code_product"]
    $doc_code     = $keys["doc_code"]
    $code_model   = $keys["code_model"]
    $doc_version  = $keys["doc_version"]

    if (-not $code_product -or -not $doc_code -or -not $doc_version) {
        throw "Missing required keys!"
    }

    if ($code_model -eq "00") {
        return "${code_product}${doc_code}_${doc_version}.pdf"
    } else {
        return "${code_product}-${code_model}${doc_code}_${doc_version}.pdf"
    }
}