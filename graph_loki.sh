echo "\documentclass{article}
\usepackage[margin=0.5in]{geometry}
\usepackage{tikz}
\usepackage{amsmath}
\usetikzlibrary{calc}
\usetikzlibrary{arrows.meta}
\begin{document}
\begin{tikzpicture}" > graph.tex
n=$1
p=$((360/$n))
for (( x = 0; x < 360; x = x + $p))
do 
    y=$(($x+$p))
    a=$(($x/$p + 1 ))
    echo '\node('"$a"') at ('"$x"': 8cm) [circle,radius=1cm,draw]{$V_{'"$a"'}$};' >> graph.tex
done
for (( x = 0; x < 360; x = x + $p))
do 
    a=$(($x/$p + 1 ))
    for (( y = $x + $p; y < 360; y = y + $p))
    do 
        b=$(($y/$p + 1 ))
        echo '\draw[red!50!black, -Stealth] ('"$b"') edge node[near start,above,sloped] {$V_{'"$b,"''"$a"'}$} ('"$a"') ;' >> graph.tex
    done
done
echo '\end{tikzpicture}
\end{document}' >> graph.tex
pdflatex graph.tex
rm *.aux *.log *.tex