set term tikz monochrome dashed size 5in,3in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title "$a = 81.978, b = 1.199, c = 225.610, R^2 = 0.061$"
set title font ",12"
set format xy "%g"
set output "myincl-plot1-1.tex"
a = 81.977547
b = 1.199334
c = 225.609545
f(x) = (a+b*c*x)/(b*x+1)  
plot f(x) lw 3 lt 1 smooth csplines title "Curve", "myincl-data.txt" using 1:2 lw 1 lt 4  title "Raw Data"
set output
unset ylabel
unset xlabel
