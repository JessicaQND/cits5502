set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 76.547, b = 1.343, c = 187.991, R^2 = 0.071$"
set title font ",12"
set format xy "%g"
set output "myincl-plot3-1.tex"
a = 76.547243
b = 1.343168
c = 187.991054
f(x) = (a-c)*exp(-b*x)+c  
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "myincl-data.txt" using 1:2 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
