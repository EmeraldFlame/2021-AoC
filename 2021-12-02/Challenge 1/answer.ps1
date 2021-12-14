$horizontal = $vertical = 0

$inputs = Import-Csv .\input.txt -Delimiter ' ' -Header 'Direction', 'Value'

switch ($inputs) {
    {$_.Direction -eq 'forward'} { $horizontal += $_.Value }
    {$_.Direction -eq 'up'}      { $vertical -= $_.Value }
    {$_.Direction -eq 'down'}    { $vertical += $_.Value }
}

Write-Host "Answer is $($horizontal * $vertical)"