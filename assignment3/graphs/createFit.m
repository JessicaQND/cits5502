function [as, bs, cs, rsqs] = createFit(prefix, dataX, dataY, init)
eqs = char({'(a+b*c*x)/(b*x+1)',  '(a-c)*(x+1)^(-b)+c', ...
        '(a-c)*exp(-b*x)+c',  'a+b*x+c*x^2'});

eqs_gp = char({'(a+b*c*x)/(b*x+1)',  '(a-c)*(x+1)**(-b)+c', ...
        '(a-c)*exp(-b*x)+c',  'a+b*x+c*x**2'});

sze = size(dataY);
data = [dataX, dataY];
dlmwrite(strcat(prefix, '-data.txt'), data, '\t');
      
as = zeros(4, sze(2));
bs = zeros(4, sze(2));
cs = zeros(4, sze(2));

rsqs = zeros(4, sze(2));

for i=1:4,
  for j=1:sze(2),
    [xData, yData] = prepareCurveData(dataX, dataY(1:end,j));

    % Set up fittype and options.
    ft = fittype( eqs(i,1:end), 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( ft );
    opts.Display = 'Off';
    opts.Lower = [0.0002, 0.0001, 0.0001];
    opts.StartPoint = init;
    opts.Upper = [Inf Inf Inf];

    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft, opts );
    rsq = gof.rsquare;
    indx = coeffnames(fitresult);
    vals = coeffvalues(fitresult);
    
    a = vals(find(ismember(indx,'a')));
    b = vals(find(ismember(indx,'b')));
    c = vals(find(ismember(indx,'c')));
    
    if rsq < 0
      rsq = 0;
    end
    
    as(i,j) = a;
    bs(i,j) = b;
    cs(i,j) = c;
    rsqs(i,j) = rsq;

    fp = fopen(strcat(prefix, '-plot', int2str(i), '-', int2str(j), '.p'), 'w');
    
    fprintf(fp, 'set term tikz monochrome dashed size 5in,3in font ",9"\n');
    fprintf(fp, 'set style func linespoints\n');
    fprintf(fp, 'set style data lines\n');
    fprintf(fp, 'set nogrid\n');
    fprintf(fp, 'set xrange [0:5]\n');
    fprintf(fp, 'set xlabel "$t$"\n');
    fprintf(fp, 'set ylabel "Effort (minutes)"\n');
    fprintf(fp, 'set title "$a = %.3f, b = %.3f, c = %.3f, R^2 = %.3f$"\n', ...
                    a, b, c, rsq);
    fprintf(fp, 'set title font ",12"\n');
    fprintf(fp, 'set format xy "%%g"\n');
    fprintf(fp, 'set output "%s-plot%d-%d.tex"\n', prefix, i, j);
    fprintf(fp, 'a = %f\n', a);
    fprintf(fp, 'b = %f\n', b);
    fprintf(fp, 'c = %f\n', c);
    fprintf(fp, 'f(x) = %s\n', eqs_gp(i,1:end));
    fprintf(fp, 'plot f(x) lw 3 lt 1 smooth csplines title "Curve", ');
    fprintf(fp, '"%s" using 1:%d lw 1 lt 4  title "Raw Data"\n', ...
                    strcat(prefix, '-data.txt'), j+1);
    fprintf(fp, 'set output\n');
    fprintf(fp, 'unset ylabel\n');
    fprintf(fp, 'unset xlabel\n');
    
    fclose(fp);
  end
end
end

