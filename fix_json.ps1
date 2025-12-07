# PowerShell script to fix multiline strings in JSON
$jsonPath = "config\tweaks.json"
$content = Get-Content $jsonPath -Raw

# Replace multiline InvokeScript and UndoScript entries
$content = $content -replace '(?s)"(InvokeScript|UndoScript)":\s*\[\s*"\s*\r?\n(.*?)"\s*\]', {
    param($match)
    $name = $match.Groups[1].Value
    $script = $match.Groups[2].Value
    # Replace line breaks with \n
    $script = $script -replace '\r?\n', '\n'
    # Escape backslashes (but not already escaped ones)
    $script = $script -replace '\\', '\\'
    # Escape double quotes
    $script = $script -replace '"', '\"'
    
    "`"$name`": [`"$script`"]"
}

$content | Set-Content $jsonPath -NoNewline
Write-Host "Fixed JSON file"
