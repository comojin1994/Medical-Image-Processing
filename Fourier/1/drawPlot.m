function drawPlot(N)
    figure;
    x = [0:pi/100:pi];
    y = x * pi - x.^2;
    re = 0;
    for n = 1:N
        re = re + (4 / pi) * ([1-(-1)^n]/n^3)*sin(n*x);
    end
    plot(x, y, 'r', x, re, 'g')
    legend('original', strcat('N=',int2str(N)));
    savefig(strcat(strcat('plot',int2str(N)), '.fig'))
end