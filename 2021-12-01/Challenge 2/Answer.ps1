#weirdly, powershell answer was one off without the explicit typecasting. Typically it's better about automatically handling that
[int[]]$depthMeasures = Get-Content '.\input.txt'
$comparisons = [PSCustomObject]@{
    Increased = 0
    Equal     = 0
    Decreased = 0
}

for ($i = 1; $i -lt $depthMeasures.Count-2; $i++) {
    $j = $i+2
    $x = $i-1
    $y = $x+2
    
    if (($depthMeasures[$i..$j] | Measure-Object -Sum).Sum -gt ($depthMeasures[$x..$y] | Measure-Object -Sum).Sum) {
        $comparisons.Increased++
    } elseif (($depthMeasures[$i..$j] | Measure-Object -Sum).Sum -eq ($depthMeasures[$x..$y] | Measure-Object -Sum).Sum) {
        $comparisons.equal++
    } else {
        $comparisons.Decreased++
    }
}

$comparisons | Format-Table