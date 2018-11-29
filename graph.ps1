Add-Content graph.tex -Value "\documentclass{article}
\usepackage[margin=0.5in]{geometry}
\usepackage{tikz}
\usepackage{amsmath}
\usetikzlibrary{calc}
\usetikzlibrary{arrows.meta}
\begin{document}
\begin{tikzpicture}" 
Write-Host "Choose type of graph :
1. Directed
2. Undirected"
$type = Read-Host -Prompt "Your Response"
$ask = Read-Host -Prompt "Wanna give adj matrix"
if($ask -ne 'no') {
    $matrix = Read-Host -Prompt "File name of adjacency matrix"
    $matrix = Get-Content $matrix
    $n = $matrix.length
    $t = $(($n - 1))
    $matrix = $matrix -split "`n"
    foreach ($i in (0..$t)) {
        $matrix[$i] = $matrix[$i] -split " "
    }
}
else {$n= Read-Host -Prompt "Enter Number of Vertices"}

$p=$((360/$n))
for ( $x = 0; $x -lt 360; $x = $x + $p) {
    $y=$(($x+$p))
    $a=$(($x/$p + 1 ))
    $str = "\node($a) at ($x : 8cm) [circle,radius=1cm,draw]{" + '$' + "V_{$a}$};"
    Add-Content graph.tex -Value $str 
    
}
for ( $x = 0; $x -lt 360; $x = $x + $p) { 
    $a=$(($x/$p + 1 ))
    for ( $y = 0; $y -lt 360; $y = $y + $p) { 
        $b=$(($y/$p + 1 ))
        $col = $((($b * 2) - 2))
        if($ask -ne 'no') {$check =  $matrix[$(($a - 1))][$col]}
        else {$check = 1}
        if($check -ne '0' -and $type -eq '1') {
            if($a -eq $b) {
                if($y -ge 90 -and $y -le 180) {$str = "\draw[thick,->] ($a) to [out=90,in=180,loop,looseness=4.8] ($b);"}
                if($y -ge 0 -and $y -le 89) {$str = "\draw[thick,->] ($a) to [out=0,in=90,loop,looseness=4.8] ($b);"}
                if($y -ge 181 -and $y -le 270) {$str = "\draw[thick,->] ($a) to [out=180,in=270,loop,looseness=4.8] ($b);"}
                if($y -ge 271 -and $y -le 359) {$str = "\draw[thick,->] ($a) to [out=270,in=0,loop,looseness=4.8] ($b);"}
            }
            else {
                $str = "\draw[thick,->,shorten >=1pt] ($a) to[bend left] node[near start,above,sloped] {" + '$V_' + "{$a,$b}$} ($b);" 
            }
            Add-Content graph.tex -Value $str  
        }
        if($check -ne '0' -and $type -eq '2') {
            if($a -eq $b) {
                if($y -ge 90 -and $y -le 180) {$str = "\draw[thick] ($a) to [out=90,in=180,loop,looseness=4.8] ($b);"}
                if($y -ge 0 -and $y -le 89) {$str = "\draw[thick] ($a) to [out=0,in=90,loop,looseness=4.8] ($b);"}
                if($y -ge 181 -and $y -le 270) {$str = "\draw[thick] ($a) to [out=180,in=270,loop,looseness=4.8] ($b);"}
                if($y -ge 271 -and $y -le 359) {$str = "\draw[thick] ($a) to [out=270,in=0,loop,looseness=4.8] ($b);"}
            }
            else {
                $str = "\draw[thick] ($a) -- ($b);" 
            }
            Add-Content graph.tex -Value $str
        }
    }
}
Add-Content graph.tex -Value '\end{tikzpicture}
\end{document}' 
wsl dos2unix graph.tex
wsl pdflatex graph.tex > temp.txt
$say = Get-Content temp.txt | Select-Object -last 2
$say
Remove-Item *.aux,*.log,temp.txt,*.tex