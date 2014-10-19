set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 90.000, b = 1.157, c = 22.918, R^2 = 1.000$"
set title font ",12"
set format xy "%g"
set output "myexcl-plot3-1.tex"
a = 90.000000
b = 1.157487
c = 22.917733
f(x) = (a-c)*exp(-b*x)+c  
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "myexcl-data.txt" using 1:2 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
