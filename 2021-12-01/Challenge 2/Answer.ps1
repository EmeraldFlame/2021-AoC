#weirdly, powershell answer was one off without the explicit typecasting. Typically it's better about automatically handling that
[int[]]$depthMeasures = Get-Content '.\input.txt'
$comparisons = [PSCustomObject]@{
    Increased = 0
    Equal     = 0
    Decreased = 0
}

for ($i = 1; $i -lt $depthMeasures.Count; $i++) {
    if ($depthMeasures[$i] -gt $depthMeasures[$i-1]) {
        $comparisons.Increased++
    } elseif ($depthMeasures[$i] -eq $depthMeasures[$i-1]) {
        $comparisons.equal++
    } else {
        $comparisons.Decreased++
    }
}

$comparisons | Format-Table