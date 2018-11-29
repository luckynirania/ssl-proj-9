Add-Content graph.tex -Value "\documentclass{article}
\usepackage[margin=0.5in]{geometry}
\usepackage{tikz}
\usepackage{amsmath}
\usetikzlibrary{calc}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{decorations.markings}
\begin{document}
\tikzset{->-/.style={decoration={markings,mark=at position 0.5 with {\arrow{>}}},postaction={decorate}}}
\begin{tikzpicture}" 
Write-Host "Choose type of graph :
1. Directed
2. Undirected"
$type = Read-Host -Prompt "Your Response"
$sr = 'ho'
if($type -eq '1' -or $type -eq '2') {
    $sr = 'hi'
}
while($sr -eq 'ho') {
    echo "Enter Valid Response"
    $type = Read-Host -Prompt "Your Response"
    if($type -eq '1' -or $type -eq '2') {
        $sr = 'hi'
    }
}
$ask = Read-Host -Prompt "Wanna give adj matrix (type 'no' for no; anything else will be considered as 'yes'"
if($ask -ne 'no') {
    $matrix = Read-Host -Prompt "File name of adjacency matrix"
    if($matrix -eq '') {
        $matrix = "gfbf,cxgdzhgdfgcxvjhgsdfafdgxcfxdsgcxcfaseagfdgxngdfzsFSGcnxnxcgfdss"
    }
    while((Test-Path $matrix) -ne 'True') {
        echo "File doesn't exists, please try again"
        $matrix = Read-Host -Prompt "File name of adjacency matrix"
        if($matrix -eq '') {
            $matrix = "gfbf,cxgdzhgdfgcxvjhgsdfafdgxcfxdsgcxcfaseagfdgxngdfzsFSGcnxnxcgfdss"
        }
    }
    $matrix = Get-Content $matrix
    $matrix = $matrix -split "`n"
    $matrix = $matrix.TrimEnd()
    $max = 0
    foreach ($i in (0..$t)) {
        if($max -lt $matrix[$i].length) {
            $max = $matrix[$i].length
        }
    }
    $max = ((($max + 1) / 2))
    if($max -lt $matrix.length) {
        $loki = $matrix.length
    }
    else {
        $loki = $max
    }
    $ite = $(($loki - 1))
    foreach ($i in (0..$(($matrix.length - 1)))) {
        $fre = $((($loki * 2)-1))
        if($matrix[$i].length -ne $fre) {
            foreach ($j in ($matrix[$i].length..$(($fre-1)))) {
                $matrix[$i] = $matrix[$i] + ' '
            }
        }
        $aqs = $aqs + $matrix[$i] + "`n"
    }
    foreach ($i in ($matrix.length..$ite)) {
        foreach ($j in (0..$(($fre-1)))) {
            $aqs = $aqs + ' '
        }
        if($i -ne $ite) {
            $aqs = $aqs + "`n"
        }
    }
    $matrix = $aqs
    $matrix = $matrix -split "`n"
    $u = $matrix.length
    $t = $(($n - 1))
    
}
else {
    $u= Read-Host -Prompt "Enter Number of Vertices"
    $st = 'ho'
    if($u -ne '0') {
        $st = 'hi'
    }
    while($st -eq 'ho') {
        echo "zero is not valid, please try again"
        $u= Read-Host -Prompt "Enter Number of Vertices"
        if($u -ne '0') {
            $st = 'hi'
        }   
    }
}
$n = $u
$p=$((360/$n))
for ( $x = 0; $x -lt 360; $x = $x + $p) {
    $y=$(($x+$p))
    $a=$(($x/$p + 1 ))
    $str = "\node($a) at ($x : 8cm) [circle,radius=1cm,draw]{" + '$' + "$a$};"
    Add-Content graph.tex -Value $str 
    
}
for ( $x = 0; $x -lt 360; $x = $x + $p) { 
    $a=$(($x/$p + 1 ))
    for ( $y = 0; $y -lt 360; $y = $y + $p) { 
        $b=$(($y/$p + 1 ))
        $col = $((($b * 2) - 2))
        if($ask -ne 'no') {
            $check =  $matrix[$(($a - 1))][$col]
            if($check -eq " ") {
                $check = '0'
            }
        }
        else {$check = " "}
        if($check -ne '0' -and $type -eq '1') {
            if($a -eq $b) {
                if($y -ge 90 -and $y -le 180) {$str = "\draw[thick,->-] ($a) to [out=90,in=180,loop,looseness=4.8] node[above,sloped] {" + '$' + "$check$} ($b);"}
                if($y -ge 0 -and $y -le 89) {$str = "\draw[thick,->-] ($a) to [out=0,in=90,loop,looseness=4.8] node[above,sloped] {" + '$' + "$check$} ($b);"}
                if($y -ge 181 -and $y -le 270) {$str = "\draw[thick,->-] ($a) to [out=180,in=270,loop,looseness=4.8] node[below,sloped] {" + '$' + "$check$} ($b);"}
                if($y -ge 271 -and $y -le 359) {$str = "\draw[thick,->-] ($a) to [out=270,in=0,loop,looseness=4.8] node[below,sloped] {" + '$' + "$check$} ($b);"}
            }
            else {
                $str = "\draw[thick,->-,shorten >=1pt] ($a) to[bend left] node[above,sloped] {" + '$' + "$check$} ($b);" 
            }
            Add-Content graph.tex -Value $str  
        }
        if($check -ne '0' -and $type -eq '2') {
            if($a -eq $b) {
                if($y -ge 90 -and $y -le 180) {$str = "\draw[thick] ($a) to [out=90,in=180,loop,looseness=4.8] node[above,sloped] {" + '$' + "$check$} ($b);"}
                if($y -ge 0 -and $y -le 89) {$str = "\draw[thick] ($a) to [out=0,in=90,loop,looseness=4.8] node[above,sloped] {" + '$' + "$check$} ($b);"}
                if($y -ge 181 -and $y -le 270) {$str = "\draw[thick] ($a) to [out=180,in=270,loop,looseness=4.8] node[below,sloped] {" + '$' + "$check$} ($b);"}
                if($y -ge 271 -and $y -le 359) {$str = "\draw[thick] ($a) to [out=270,in=0,loop,looseness=4.8] node[below,sloped] {" + '$' + "$check$} ($b);"}
            }
            else {
                $str = "\draw[thick,shorten >=1pt] ($a) edge node[above,sloped] {" + '$' + "$check$} ($b);" 
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
.\graph.pdf