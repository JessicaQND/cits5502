set datafile separator ","
set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set xrange [1:20]

set style line 1 

set xlabel "$t$ (weeks)"
unset title

dir1 = "dexport/aggalt/"
dir2 = "dexport/major-minor-easy-hard/"
dir3 = "dexport/111/"
dir4 = "dexport/223/"
dir5 = "dexport/111123333/"

set output dir1.'tifd-comp.tex'
set ylabel "$\\sum_{p \\in P} p d_p(t)$" offset -2
plot \
	dir2.'results-modded.csv' using 1:3 lw 3 lt 1 smooth csplines title "Baseline", \
	dir3.'results.csv' using 1:3 lw 1 lt 2 smooth csplines title "Scenario B", \
	dir4.'results.csv' using 1:3 lw 1 lt 3 smooth csplines title "Scenario C", \
	dir5.'results.csv' using 1:3 lw 1 lt 4 smooth csplines title "Scenario D"

set output dir1.'dfdf-comp.tex'
set ylabel "$\\frac{d(t)}{df(t)}$" offset -2
plot \
	dir2.'results-modded.csv' using 5:7 lw 3 lt 1 smooth csplines title "Baseline", \
	dir3.'results.csv' using 5:7 lw 1 lt 2 smooth csplines title "Scenario B", \
	dir4.'results.csv' using 5:7 lw 1 lt 3 smooth csplines title "Scenario C", \
	dir5.'results.csv' using 5:7 lw 1 lt 4 smooth csplines title "Scenario D"

set output dir1.'queuetime-comp.tex'
set ylabel "$\\frac{\\mathit{df}(t) + \\mathit{dc}(t)}{\\mathit{df}(t)}$ (weeks)" offset -2
plot \
	dir2.'results-modded.csv' using 9:11 lw 3 lt 1 smooth csplines title "Baseline", \
	dir3.'results.csv' using 9:11 lw 1 lt 2 smooth csplines title "Scenario B", \
	dir4.'results.csv' using 9:11 lw 1 lt 3 smooth csplines title "Scenario C", \
	dir5.'results.csv' using 9:11 lw 1 lt 4 smooth csplines title "Scenario D"
	
set output dir1.'remainingbugs-comp.tex'
set ylabel "$\\int_{t}^{\\infty} \\! be^{cx} \\, \\mathrm{d}x$ (defects)" offset -2
plot \
	dir2.'results-modded.csv' using 13:15 lw 3 lt 1 smooth csplines title "Baseline", \
	dir3.'results.csv' using 13:15 lw 1 lt 2 smooth csplines title "Scenario B", \
	dir4.'results.csv' using 13:15 lw 1 lt 3 smooth csplines title "Scenario C", \
	dir5.'results.csv' using 13:15 lw 1 lt 4 smooth csplines title "Scenario D"