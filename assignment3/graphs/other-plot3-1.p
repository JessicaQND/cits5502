set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 170.400, b = 0.767, c = 37.515, R^2 = 0.994$"
set title font ",12"
set format xy "%g"
set output "other-plot3-1.tex"
a = 170.399726
b = 0.767170
c = 37.515471
f(x) = (a-c)*exp(-b*x)+c  
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "other-data.txt" using 1:2 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
