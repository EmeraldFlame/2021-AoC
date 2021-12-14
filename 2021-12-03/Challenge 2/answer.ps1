$oxygen = $co2 = Get-Content .\input.txt

for ($x = 0; $x -lt $oxygen[0].length; $x++) {
    if ($oxygen.Count -gt 1) {
        if (($oxygen.Substring($x,1) | Measure-Object -Average).Average -ge 0.5) {
            $oxygen = $oxygen | Where-Object { $_[$x] -eq '1' }
        } else {
            $oxygen = $oxygen | Where-Object { $_[$x] -eq '0' }
        }
    }

    if ($co2.Count -gt 1) {
        if (($co2.Substring($x,1) | Measure-Object -Average).Average -ge 0.5) {
            $co2 = $co2 | Where-Object { $_[$x] -eq '0' }
        } else {
            $co2 = $co2 | Where-Object { $_[$x] -eq '1' }
        }
    }
}

Write-Host "Oxygen Binary: $oxygen"
Write-Host "co2 Binary   : $co2"

$oxygen  = [convert]::ToInt32($oxygen,2)
$co2     = [convert]::ToInt32($co2,2)

Write-Host "Oxygen Decimal: $oxygen"
Write-Host "co2 Decimal   : $co2"
Write-Host "Answer is $($oxygen * $co2)"