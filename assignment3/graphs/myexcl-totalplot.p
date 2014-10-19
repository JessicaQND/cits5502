set term tikz monochrome dashed size 6in,8in font ",9"
set style func linespoints
set style data lines
set nogrid
set xrange [0:5]
set xlabel "$t$"
set ylabel "Effort (minutes)"
set title ""
set title font ",12"
set format xy "%g"
set output "myexcl-totalplot.tex"

a1 = 90.000000
b1 = 1.280702
c1 = 8.082192
f(x) = (a1+b1*c1*x)/(b1*x+1)  

a2 = 90.000000
b2 = 1.275635
c2 = 11.629631
g(x) = (a2-c2)*(x+1)**(-b2)+c2

a3 = 90.000000
b3 = 1.157487
c3 = 22.917733
h(x) = (a3-c3)*exp(-b3*x)+c3

a4 = 52.999967
b4 = 0.000001
c4 = 0.000001
i(x) = a4+b4*x+c4*x**2  
 
plot f(x) lw 1 smooth csplines title "Model A", \
	g(x) lw 1 smooth csplines title "Model B", \
	h(x) lw 1 smooth csplines title "Model C", \
	i(x) lw 1 smooth csplines title "Model D", \
	"myexcl-data.txt" using 1:2 lw 3 lt 1  title "Raw Data"
set output
unset ylabel
unset xlabel
