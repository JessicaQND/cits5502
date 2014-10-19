set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 96.649, b = 0.000, c = 0.000, R^2 = 0.000$"
set title font ",12"
set format xy "%g"
set output "other-plot4-1.tex"
a = 96.649497
b = 0.000100
c = 0.000100
f(x) = a+b*x+c*x**2       
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "other-data.txt" using 1:2 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
