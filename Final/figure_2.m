function figure_2(img_ori)
    subplot(551); imshow(img_ori, []); title('Original');
    
    f = img_ori(:,:,1);
    subplot(552); imshow(f(end:-1:1, :), []); title('상하반전');
    subplot(553); imshow(f(:, end:-1:1), []); title('좌우반전');
    subplot(554); imshow(f(end:-1:1, end:-1:1), []); title('대각선반전');
    
    g = img_ori(:,:,1);
    subplot(555); g1 = imadjust(g, [0 1], [1 0]);
    imshow(g1); title('Complement');
    subplot(556); g2 = imadjust(g, [0.5 0.75], [0 1]);
    imshow(g2); title('Focusing to [50% 75%]');
    subplot(557); g3 = imadjust(g, [0 1], [0 1], 2);
    imshow(g3); title('square');
    
    eps = 0.1; E = 20;
    m1 = 180.0;
    g4 = 1./(1.+(double(m1)./(double(g)+eps)).^E);
    subplot(558); imshow(g4); title('m = 180');
    
    m2 = 90.0;
    g5 = 1./(1.+(double(m2)./(double(g)+eps)).^E);
    subplot(559); imshow(g5); title('m = 90');
    
    g6 = g - 50;
    subplot(5,5,10); imshow(g6); title('g - 50');
    g7 = g * 2;
    subplot(5,5,11); imshow(g7); title('g * 2');
    g8 = double(g) - double(g1);
    subplot(5,5,12); imshow(g8); title('original - complement');
    
    img_ori = im2double(img_ori);
    noise = imnoise(zeros(size(img_ori)), 'gaussian', 0, 0.001);
    img = img_ori + noise;
    
    LSF = fspecial('motion', 7, 45);
    Sn = abs(fft2(noise)).^2; nA = sum(Sn(:)) / prod(size(noise));
    Sf = abs(fft2(img_ori)).^2; fA = sum(Sf(:)) / prod(size(img_ori));
    R = nA / fA;
    
    subplot(5,5,13); imshow(deconvwnr(img, LSF, R), []); title('Wiener Deconv 0.0011')
    subplot(5,5,14); imshow(deconvwnr(img, LSF, 0.03), []); title('Wiener Deconv 0.03')
    subplot(5,5,15); imshow(deconvreg(img, LSF, 0), []); title('Regularization 0')
    subplot(5,5,16); imshow(deconvreg(img, LSF, 4), []); title('Regularization 4')
    
    PSF = fspecial('gaussian', 7, 45);
    SD = 0.001; DAMPAR = 10*SD;  WEIGHT=ones(size(img));
    
    NUMIT = 5; fr = deconvlucy(img, PSF, NUMIT, DAMPAR, WEIGHT);
    subplot(5,5,17); imshow(fr); title('Lucy Richardson 5');
    NUMIT = 10; fr = deconvlucy(img, PSF, NUMIT, DAMPAR, WEIGHT);
    subplot(5,5,18); imshow(fr); title('Lucy Richardson 10');
    NUMIT = 20; fr = deconvlucy(img, PSF, NUMIT, DAMPAR, WEIGHT);
    subplot(5,5,19); imshow(fr); title('Lucy Richardson 20');
    
    PSF = fspecial('gaussian', 128, 5);    
    SD = 0.01; g = imnoise(imfilter(img_ori, PSF), 'gaussian', 0, SD^2);
    WEIGHT=ones(size(g));
    DAMPAR = 10*SD; INITPSF = ones(size(PSF));
    
    NUMIT = 5; [fr, PSFe] = deconvblind(g, INITPSF, NUMIT, DAMPAR, WEIGHT);
    subplot(5,5,20), imshow(fr, []); title('5');
    
    NUMIT = 10; [fr, PSFe] = deconvblind(g, INITPSF, NUMIT, DAMPAR, WEIGHT);
    subplot(5,5,21), imshow(fr, []); title('10');
    
    fr=(img_ori(:,:,1)); fg=(img_ori(:,:,2)); fb=(img_ori(:,:,3));
    subplot(5,5,22), imshow(cat(1, fr,fg,fb)); title('Split RGB');
    subplot(5,5,23), imshow(cat(3, fr,fb,fg)); title('RBG');
    subplot(5,5,24), imshow(cat(3, fg,fb,fr)); title('GBR');
    subplot(5,5,25), imshow(cat(3, fb,fr,fg)); title('BRG');
end