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
$ask = Read-Host -Prompt "Wanna give adj matrix (type 'yes' for yes; anything else will be considered as 'no'"
if($ask -eq 'yes') {
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
    py l.py $matrix
    $matrix = Get-Content tmpe.txt
    rm tmpe.txt
    $u = $matrix.length
    $t = $(($n - 1))
    $matrix = $matrix -split "`n"
    foreach ($i in (0..$t)) {
        $matrix[$i] = $matrix[$i] -split " "
    }
}
else {
    $u= Read-Host -Prompt "Enter Number of Vertices"
    $st = 'ho'
    $u = [int]$u
    if($u -gt 0) {
        $st = 'hi'
    }
    while($st -eq 'ho') {
        echo "Enter a positive integer"
        $u= Read-Host -Prompt "Enter Number of Vertices"
        $u = [int]$u
        if($u -gt 0) {
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
        if($ask -eq 'yes') {$check =  $matrix[$(($a - 1))][$col]}
        else {$check = " "}
        if($check -ne '0' -and $type -eq '1') {
            if($u -lt 24) {
                if($a -eq $b) {
                    if($y -ge 90 -and $y -le 180) {$str = "\draw[thick,->-] ($a) to [out=90,in=180,loop,looseness=4.8] node[above,sloped] {" + '$' + "$check$} ($b);"}
                    if($y -ge 0 -and $y -le 89) {$str = "\draw[thick,->-] ($a) to [out=0,in=90,loop,looseness=4.8] node[above,sloped] {" + '$' + "$check$} ($b);"}
                    if($y -ge 181 -and $y -le 270) {$str = "\draw[thick,->-] ($a) to [out=180,in=270,loop,looseness=4.8] node[below,sloped] {" + '$' + "$check$} ($b);"}
                    if($y -ge 271 -and $y -le 359) {$str = "\draw[thick,->-] ($a) to [out=270,in=0,loop,looseness=4.8] node[below,sloped] {" + '$' + "$check$} ($b);"}
                }
                else {
                    $str = "\draw[thick,->-,shorten >=1pt] ($a) to[bend left] node[above,sloped] {" + '$' + "$check$} ($b);" 
                }
            }
            else  {
                if($a -eq $b) {
                    if($y -ge 90 -and $y -le 180) {$str = "\draw[thick,->] ($a) to [out=90,in=180,loop,looseness=4.8] node[above,sloped] {" + '$' + "$check$} ($b);"}
                    if($y -ge 0 -and $y -le 89) {$str = "\draw[thick,->] ($a) to [out=0,in=90,loop,looseness=4.8] node[above,sloped] {" + '$' + "$check$} ($b);"}
                    if($y -ge 181 -and $y -le 270) {$str = "\draw[thick,->] ($a) to [out=180,in=270,loop,looseness=4.8] node[below,sloped] {" + '$' + "$check$} ($b);"}
                    if($y -ge 271 -and $y -le 359) {$str = "\draw[thick,->] ($a) to [out=270,in=0,loop,looseness=4.8] node[below,sloped] {" + '$' + "$check$} ($b);"}
                }
                else {
                    $str = "\draw[thick,->,shorten >=1pt] ($a) to[bend left] node[above,sloped] {" + '$' + "$check$} ($b);" 
                }
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
wsl pdflatex graph.tex > t
$say = Get-Content t | Select-Object -last 2
$say
Remove-Item *.aux,t,*.log,*.tex
.\graph.pdf