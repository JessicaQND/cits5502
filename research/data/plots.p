set datafile separator ","
set style func linespoints
set style data lines
set nogrid
set xlabel "Year"
set format xy "%g"
set key off

set ylabel "\\%"
set term tikz monochrome dashed size 4.3in,3.2in font ",9"
set output "fdaplot1-presentation.tex"
plot "stats3.csv" using 1:4
set output

set term tikz monochrome dashed size 5in,3in font ",9"
set output "fdaplot1-report.tex"
plot "stats3.csv" using 1:4
set output

unset ylabel
set term tikz monochrome dashed size 4.3in,3.2in font ",9"
set output "fdaplot2-presentation.tex"
plot "stats3.csv" using 1:3
set output

set term tikz monochrome dashed size 5in,3in font ",9"
set output "fdaplot2-report.tex"
plot "stats3.csv" using 1:3
set output