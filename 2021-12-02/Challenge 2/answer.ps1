$horizontal = $vertical = $aim = 0

$inputs = Import-Csv .\input.txt -Delimiter ' ' -Header 'Direction', 'Value'

switch ($inputs) {
    {$_.Direction -eq 'forward'} { 
        $horizontal += $_.Value
        $vertical   += $aim * $_.value 
    }
    {$_.Direction -eq 'up'}      { $aim -= $_.Value }
    {$_.Direction -eq 'down'}    { $aim += $_.Value }
}

Write-Host "Answer is $($horizontal * $vertical)"