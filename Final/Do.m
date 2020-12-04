function Do(path1, path2)
    img_ori = imread(path1);
    figure(1);
    figure_1(img_ori);
    
    img_ori = imread(path2);
    figure(2);
    figure_2(img_ori);
    
end