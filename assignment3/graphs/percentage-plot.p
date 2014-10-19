set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:3]
set xtics 0, 1
set yrange [0:60]
set title font ",12"
set format xy "%g"
unset title

set output "percentage-plot.tex"
set ylabel "\\%"
set xlabel "$t$"

plot \
	'my-percentage-data.txt' using 1:2 lw 3 lt 1 smooth csplines title "Knowledge Acquisition", \
	'my-percentage-data.txt' using 1:3 lw 1 lt 2 smooth csplines title "Solution Definition", \
	'my-percentage-data.txt' using 1:4 lw 1 lt 3 smooth csplines title "Knowledge Encoding", \
	'my-percentage-data.txt' using 1:5 lw 1 lt 4 smooth csplines title "Solution Validation"
	
set output "percentage-plot-excl.tex"

plot \
	'my-percentage-data-excl.txt' using 1:2 lw 3 lt 1 smooth csplines title "Knowledge Acquisition", \
	'my-percentage-data-excl.txt' using 1:3 lw 1 lt 2 smooth csplines title "Solution Definition", \
	'my-percentage-data-excl.txt' using 1:4 lw 1 lt 3 smooth csplines title "Knowledge Encoding", \
	'my-percentage-data-excl.txt' using 1:5 lw 1 lt 4 smooth csplines title "Solution Validation"

set output
unset ylabel
unset xlabel