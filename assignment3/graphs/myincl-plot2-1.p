set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 80.000, b = 1.564, c = 206.678, R^2 = 0.062$"
set title font ",12"
set format xy "%g"
set output "myincl-plot2-1.tex"
a = 80.000014
b = 1.563815
c = 206.677840
f(x) = (a-c)*(x+1)**(-b)+c
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "myincl-data.txt" using 1:2 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
