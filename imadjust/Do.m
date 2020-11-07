function Do()
    f = imread('../example.jpeg');
    g = f(:,:,1);
    figure();
    subplot(3,3,1); imshow(g); title('Original Image');
    subplot(3,3,2); g1 = imadjust(g, [0 1], [1 0]);
    imshow(g1); title('Complement');
    subplot(3,3,3); g2 = imadjust(g, [0.5 0.75], [0 1]);
    imshow(g2); title('Focusing to [50% 75%]');
    subplot(3,3,4); g3 = imadjust(g, [0 1], [0 1], 2);
    imshow(g3); title('square');
    
    eps = 0.1; E = 20;
    m1 = 180.0;
    g4 = 1./(1.+(double(m1)./(double(g)+eps)).^E);
    subplot(3,3,5); imshow(g4); title('m = 180');
    
    m2 = 90.0;
    g5 = 1./(1.+(double(m2)./(double(g)+eps)).^E);
    subplot(3,3,6); imshow(g5); title('m = 90');
    
    g6 = g - 50;
    subplot(3,3,7); imshow(g6); title('g - 50');
    g7 = g * 2;
    subplot(3,3,8); imshow(g7); title('g * 2');
    g8 = double(g) - double(g1);
    subplot(3,3,9); imshow(g8); title('original - complement');
end