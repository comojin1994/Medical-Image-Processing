function Do3
    fprintf('(1): cosj\n\n');
    for k = 0:5
        fprintf(strcat('k : ', int2str(k)));
        fprintf('\n');
        for j = 0:5
            display(cos(j) * exp(2i * pi * j * k / 5));
        end
    end
    
    fprintf('(5): j^2\n\n');
    for k = 0:5
        fprintf(strcat('k : ', int2str(k)));
        fprintf('\n');
        for j = 0:5
            display((j^2) * exp(2i * pi * j * k / 5));
        end
    end
    
    fprintf('(9): 역변환\n\n');
    for k = 0:6
        fprintf(strcat('k : ', int2str(k)));
        fprintf('\n');
        for j = 0:6
            display((exp(-k*i) * exp(2i * pi * j * k / 7))/7); 
        end
    end
end