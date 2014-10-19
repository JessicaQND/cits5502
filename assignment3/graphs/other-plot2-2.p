set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 86.030, b = 0.798, c = 31.227, R^2 = 0.987$"
set title font ",12"
set format xy "%g"
set output "other-plot2-2.tex"
a = 86.030357
b = 0.797537
c = 31.227016
f(x) = (a-c)*(x+1)**(-b)+c
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "other-data.txt" using 1:3 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
