set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 90.000, b = 1.281, c = 8.082, R^2 = 1.000$"
set title font ",12"
set format xy "%g"
set output "myexcl-plot1-1.tex"
a = 90.000000
b = 1.280702
c = 8.082192
f(x) = (a+b*c*x)/(b*x+1)  
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "myexcl-data.txt" using 1:2 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
