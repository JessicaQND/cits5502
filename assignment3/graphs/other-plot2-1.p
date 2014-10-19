set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 171.213, b = 0.845, c = 0.000, R^2 = 0.988$"
set title font ",12"
set format xy "%g"
set output "other-plot2-1.tex"
a = 171.213195
b = 0.845190
c = 0.000100
f(x) = (a-c)*(x+1)**(-b)+c
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "other-data.txt" using 1:2 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
