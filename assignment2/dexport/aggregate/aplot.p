set datafile separator ","
set term tikz monochrome dashed size 6in,6in font ",9"
set style func linespoints
set style data lines
set xrange [1:20]
set key spacing 1.75

set style line 1 

set xlabel "$t$ (weeks)"
unset title

set output 'tifd.tex'
set ylabel "$\\sum_{p \\in P} p d_p(t)$" offset -2
plot \
	'tifd.csv' using 1:2 lw 1 title "Easy--Hard, Major--Minor" smooth csplines, \
	'tifd.csv' using 1:4 lw 1 title "Hard--Easy, Major--Minor" smooth csplines, \
	'tifd.csv' using 1:5 lw 1 title "Major--Minor, Easy--Hard" smooth csplines, \
	'tifd.csv' using 1:6 lw 1 title "Minor--Major, Easy--Hard" smooth csplines, \
	'tifd.csv' using 1:7 lw 1 title "Random" smooth csplines, \
	'tifd.csv' using 1:3 lw 1 title "First In, First Out" smooth csplines

set output 'dfdf.tex'
set ylabel "$\\frac{d(t)}{df(t)}$" offset -2
plot \
	'dfdf.csv' using 1:2 lw 1 title "Easy--Hard, Major--Minor" smooth csplines, \
	'dfdf.csv' using 1:4 lw 1 title "Hard--Easy, Major--Minor" smooth csplines, \
	'dfdf.csv' using 1:5 lw 1 title "Major--Minor, Easy--Hard" smooth csplines, \
	'dfdf.csv' using 1:6 lw 1 title "Minor--Major, Easy--Hard" smooth csplines, \
	'dfdf.csv' using 1:7 lw 1 title "Random" smooth csplines, \
	'dfdf.csv' using 1:3 lw 1 title "First In, First Out" smooth csplines

set output 'queuetime.tex'
set yrange [0:30]
set ylabel "$\\frac{\\mathit{df}(t) + \\mathit{dc}(t)}{\\mathit{df}(t)}$ (weeks)" offset -2
plot \
	'queuetime.csv' using 1:2 lw 1 title "Easy--Hard, Major--Minor" smooth csplines, \
	'queuetime.csv' using 1:4 lw 1 title "Hard--Easy, Major--Minor" smooth csplines, \
	'queuetime.csv' using 1:5 lw 1 title "Major--Minor, Easy--Hard" smooth csplines, \
	'queuetime.csv' using 1:6 lw 1 title "Minor--Major, Easy--Hard" smooth csplines, \
	'queuetime.csv' using 1:7 lw 1 title "Random" smooth csplines, \
	'queuetime.csv' using 1:3 lw 1 title "First In, First Out" smooth csplines

set autoscale y
	
set output 'remainingbugs.tex'
set ylabel "$\\int_{t}^{\\infty} \\! be^{cx} \\, \\mathrm{d}x$ (defects)" offset -2
plot \
	'remainingbugs.csv' using 1:2 lw 1 title "All" smooth csplines