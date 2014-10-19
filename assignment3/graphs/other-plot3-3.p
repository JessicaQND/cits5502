set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 112.429, b = 0.947, c = 46.232, R^2 = 0.939$"
set title font ",12"
set format xy "%g"
set output "other-plot3-3.tex"
a = 112.428735
b = 0.947487
c = 46.232395
f(x) = (a-c)*exp(-b*x)+c  
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "other-data.txt" using 1:4 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
