$gamma = $epsilon = ''
$x = 0

$inputs = Get-Content .\input.txt

for ($x = 0; $x -lt $inputs[0].length; $x++) {
    if (($inputs.Substring($x,1) | Measure-Object -Average).Average -gt 0.5) {
        $gamma   += '1'
        $epsilon += '0'
    } else {
        $gamma   += '0'
        $epsilon += '1'
    }
}

$gamma   = [convert]::ToInt32($gamma,2)
$epsilon = [convert]::ToInt32($epsilon,2)

Write-Host "Gamma   is $gamma"
Write-Host "Epsilon is $epsilon"
Write-Host "Answer is $($gamma * $epsilon)"