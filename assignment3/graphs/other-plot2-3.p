set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 112.253, b = 0.909, c = 25.009, R^2 = 0.928$"
set title font ",12"
set format xy "%g"
set output "other-plot2-3.tex"
a = 112.253251
b = 0.909251
c = 25.009170
f(x) = (a-c)*(x+1)**(-b)+c
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "other-data.txt" using 1:4 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
