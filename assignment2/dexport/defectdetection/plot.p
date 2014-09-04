set datafile separator ","
set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set xrange [1:25]

set key spacing 1.75
set style line 1 

set xlabel "$t$ (weeks)"
unset title

set output 'curve.tex'
set ylabel "$n$ (defects)" offset -2
plot \
	'results.csv' using 1:2 lw 1 lt 4 title "Raw Data", \
	'results.csv' using 1:3 lw 3 lt 1 smooth csplines title "$60.113 e^{-0.177t}$"
