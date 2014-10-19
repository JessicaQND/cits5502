set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 85.916, b = 0.881, c = 46.873, R^2 = 0.982$"
set title font ",12"
set format xy "%g"
set output "other-plot3-2.tex"
a = 85.916203
b = 0.880889
c = 46.873320
f(x) = (a-c)*exp(-b*x)+c  
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "other-data.txt" using 1:3 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
