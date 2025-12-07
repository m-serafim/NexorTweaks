# Script to clean up invalid PowerShell code fragments from tweaks.json

$jsonPath = "config\tweaks.json"
$content = Get-Content $jsonPath -Raw

# Pattern 1: Single-line param match
$pattern1 = ',\s*param\(\$match\) \$script = \$match\.Groups\[1\]\.Value -replace ''\\r\?\\n'', ''\\n'' -replace ''"'', ''\\"''; "`"InvokeScript`": \[`"\$script`"\]" ,'

# Pattern 2: Multi-line param match with name and script
$pattern2 = ',\s*\r?\n\s*param\(\$match\)\r?\n\s*\$name = \$match\.Groups\[1\]\.Value\r?\n\s*\$script = \$match\.Groups\[2\]\.Value\r?\n\s*# Replace line breaks with \\n\r?\n\s*\$script = \$script -replace ''\\r\?\\n'', ''\\n''\r?\n\s*# Escape backslashes \(but not already escaped ones\)\r?\n\s*\$script = \$script -replace ''\\\\'', ''\\\\\\\\''\r?\n\s*# Escape double quotes\r?\n\s*\$script = \$script -replace ''"'', ''\\"''\r?\n\s*\r?\n\s*"`"\$name`": \[`"\$script`"\]"\r?\n,'

Write-Host "Original file size: $($content.Length) characters"

# Remove pattern 1
$content = $content -replace $pattern1, ''

# Remove pattern 2  
$content = $content -replace $pattern2, ''

Write-Host "Cleaned file size: $($content.Length) characters"

# Save the cleaned content
Set-Content -Path $jsonPath -Value $content -NoNewline

Write-Host "File cleaned successfully!"
