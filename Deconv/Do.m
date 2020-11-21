function Do(path)
    img_ori = imread(path);
    img_ori = im2double(img_ori);
    noise = imnoise(zeros(size(img_ori)), 'gaussian', 0, 0.001);
    img = img_ori + noise;
    
    figure(1);
    subplot(331); imshow(img_ori, []); title('Original');
    subplot(332); imshow(img, []); title('Salt and Pepper');
        
    LSF = fspecial('motion', 7, 45);
    Sn = abs(fft2(noise)).^2; nA = sum(Sn(:)) / prod(size(noise));
    Sf = abs(fft2(img_ori)).^2; fA = sum(Sf(:)) / prod(size(img_ori));
    R = nA / fA;
    
    subplot(333); imshow(deconvwnr(img, LSF, R), []); title('Wiener Deconv')
    subplot(334); imshow(deconvwnr(img, LSF, 0.03), []); title('Wiener Deconv 0.03')
    subplot(335); imshow(deconvreg(img, LSF, 0), []); title('Regularization 0')
    subplot(336); imshow(deconvreg(img, LSF, 4), []); title('Regularization 4')
    
    PSF = fspecial('gaussian', 7, 45);
    SD = 0.001; DAMPAR = 10*SD;  WEIGHT=ones(size(img));
    
    NUMIT = 5; fr = deconvlucy(img, PSF, NUMIT, DAMPAR, WEIGHT);
    subplot(337); imshow(fr); title('Lucy Richardson 5');
    NUMIT = 10; fr = deconvlucy(img, PSF, NUMIT, DAMPAR, WEIGHT);
    subplot(338); imshow(fr); title('Lucy Richardson 10');
    NUMIT = 20; fr = deconvlucy(img, PSF, NUMIT, DAMPAR, WEIGHT);
    subplot(339); imshow(fr); title('Lucy Richardson 20');
    
    figure(2);
    subplot(321); imshow(img, []); title('Noise');
    PSF = fspecial('gaussian', 128, 5); 
    subplot(322), imshow(PSF,[]); title('PSF')
    
    SD = 0.01; g = imnoise(imfilter(img_ori, PSF), 'gaussian', 0, SD^2);
    WEIGHT=ones(size(g));
    DAMPAR = 10*SD; INITPSF = ones(size(PSF));
    
    NUMIT = 5; [fr, PSFe] = deconvblind(g, INITPSF, NUMIT, DAMPAR, WEIGHT);
    subplot(323), imshow(fr, []); title('5');
    subplot(324), imshow(PSFe, []); title('PSF5');
    
    NUMIT = 10; [fr, PSFe] = deconvblind(g, INITPSF, NUMIT, DAMPAR, WEIGHT);
    subplot(325), imshow(fr, []); title('10');
    subplot(326), imshow(PSFe, []); title('PSF10');
end