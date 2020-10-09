function drawDiff(N)
    figure;
    x = [0:pi/100:pi];
    y = x * pi - x.^2;
    re = 0;
    for n = 1:N
        re = re + (4 / pi) * ([1-(-1)^n]/n^3)*sin(n*x);
    end
    diff = x - re;
    plot(x, diff, 'g')
    legend(strcat('N=',int2str(N)));
    savefig(strcat(strcat('diff',int2str(N)), '.fig'))
end