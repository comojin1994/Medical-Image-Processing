function drawFourier
    figure;
    t = [-pi:2*pi/100:pi];
    syms x
    y1 = 2;
    y2 = x^2;
    a0 = int(y1, x, [0 pi]) + int(y2, x, [-pi 0]);
    re = a0/2;
    for n = 1:5
        an = (int((x^2)*cos(n*x) ,x ,[-pi 0])+int(2*cos(n*x) ,x ,[0 pi]))/pi;
        bn = (int((x^2)*sin(n*x) ,x ,[-pi 0])+int(2*sin(n*x) ,x ,[0 pi]))/pi;
        re = re + an*cos(n * t) + bn*sin(n * t);
    end
    plot(t, re, 'r')
    xline(0);
    savefig('12_3.fig')
end