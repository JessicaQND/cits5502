set datafile separator ","
set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set xrange [1:20]

set style line 1 

set xlabel "$t$ (weeks)"
unset title

set output dir.'tifd.tex'
set ylabel "$\\sum_{p \\in P} p d_p(t)$" offset -2
plot \
	dir.'results.csv' using 1:2 lw 1 lt 4 title "Raw Data", \
	dir.'results.csv' using 1:3 lw 3 lt 1 smooth csplines title "Smoothed"

set output dir.'dfdf.tex'
set ylabel "$\\frac{d(t)}{df(t)}$" offset -2
plot \
	dir.'results.csv' using 5:6 lw 1 lt 4 title "Raw", \
	dir.'results.csv' using 5:7 lw 3 lt 1 smooth csplines title "Smoothed"

set output dir.'queuetime.tex'
set ylabel "$\\frac{\\mathit{df}(t) + \\mathit{dc}(t)}{\\mathit{df}(t)}$ (weeks)" offset -2
plot \
	dir.'results.csv' using 9:10 lw 1 lt 4 title "Raw", \
	dir.'results.csv' using 9:11 lw 3 lt 1 smooth csplines title "Smoothed"

set output dir.'remainingbugs.tex'
set ylabel "$\\int_{t}^{\\infty} \\! be^{cx} \\, \\mathrm{d}x$ (defects)" offset -2
plot \
	dir.'results.csv' using 13:14 lw 1 lt 4 title "Raw", \
	dir.'results.csv' using 13:15 lw 3 lt 1 smooth csplines title "Smoothed"