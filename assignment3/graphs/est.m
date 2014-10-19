data1 = [169.8, 102.4, 60.8, 53.6;
86.2, 61.4, 56.6, 48;
111.6, 77, 46.4, 55.6].';
    
data2 = [90;44;461;25];
data3 = [90;44;25];
    
dataX = [0;1;2;3];

dataX2 = [0;1;3];

[a,b,c,r] = createFit('other', dataX, data1, [0.1321 0.7227 0.1104])
[a,b,c,r] = createFit('myincl', dataX, data2, [0.7232 0.3474 0.6606])
[a,b,c,r] = createFit('myexcl', dataX2, data3, [0.7232 0.3474 0.6606])