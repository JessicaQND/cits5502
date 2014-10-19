set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 112.088, b = 0.852, c = 24.900, R^2 = 0.929$"
set title font ",12"
set format xy "%g"
set output "other-plot1-3.tex"
a = 112.088320
b = 0.852405
c = 24.899606
f(x) = (a+b*c*x)/(b*x+1)  
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "other-data.txt" using 1:4 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
