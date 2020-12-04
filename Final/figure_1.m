function figure_1(img_ori)
    subplot(551); imshow(img_ori, []); title('Original');
    
    subplot(552); imshow(img_ori(:,:,1), jet(256)); title('pseudo jet');
    subplot(553); imshow(img_ori(:,:,1), hsv(256)); title('pseudo hsv');
    subplot(554); imshow(img_ori(:,:,1), hot(256)); title('pseudo hot');
    subplot(555); imshow(img_ori(:,:,1), cool(256)); title('pseudo cool');
    subplot(556); imshow(img_ori(:,:,1), spring(256)); title('pseudo spring');
    subplot(557); imshow(img_ori(:,:,1), summer(256)); title('pseudo summer');
    subplot(558); imshow(img_ori(:,:,1), autumn(256)); title('pseudo autumn');
    subplot(559); imshow(img_ori(:,:,1), winter(256)); title('pseudo winter');
    
    subplot(5,5,10); imshow(seg1(img_ori(:,:,1), 180, 0)); title('seg1');
    subplot(5,5,11); imshow(seg2(img_ori(:,:,1), 180, 255)); title('seg2');
    subplot(5,5,12); imshow(seg3(img_ori(:,:,1), 210, 240, 0)); title('seg3');
    subplot(5,5,13); imshow(seg4(img_ori(:,:,1), 210, 240, 255)); title('seg4');
    subplot(5,5,14); imshow(seg5(img_ori(:,:,1), 100, 200, 150, 250, 1, 255)); title('seg5');
    
    saltImg = SaltandPepper(img_ori, 0.3);
    subplot(5,5,15); imshow(saltImg); title('Salt & Pepper');
    
    fmax = ordfilt2(saltImg, 9, true(3));
    subplot(5,5,16); imshow(fmax); title('Max');
    
    fmin = ordfilt2(saltImg, 1, true(3));
    subplot(5,5,17); imshow(fmin); title('Min');
    
    fmed = ordfilt2(saltImg, 4, true(3));
    subplot(5,5,18); imshow(fmed); title('Med');
    
    fran = fmax - fmin;
    subplot(5,5,19); imshow(fran); title('Range');
    
    fmedran = ordfilt2(fmed, 9, true(3)) - ordfilt2(fmed, 1, true(3));
    subplot(5,5,20); imshow(fmedran); title('Med-Range');
    
    f1 = mat2gray(img_ori);
    ff2 = fftshift(fft2(f1));
    [m, n] = size(ff2);
    if mod(m, 2) == 1
        m = m + 1;
    end
    if mod(n, 2) == 1
        n = n + 1;
    end
    lowff = zeros(size(ff2)); mm = 100;
    lowff(m/2-mm:m/2+mm, n/2-mm:n/2+mm) = 1;
    fin = ifft2(ifftshift(ff2.*lowff));
    subplot(5,5,21); imshow(real(fin),[]); title('Lowpass Result');
    
    highff = 1 - lowff;
    fin = ifft2(ifftshift(ff2.*highff));
    subplot(5,5,22); imshow(real(fin), []); title('Highpass Result');
    
    fin = ifft2(ifftshift(ff2.*highff));
    subplot(5,5,23); imshow(real(fin) + f1); title('High contrast');
    
    mm2 = 140; mm1 = 10;
    bandff = zeros(size(ff2));
    bandff(m/2-mm2:m/2+mm2,n/2-mm2:n/2+mm2) = 1;
    bandff(m/2-mm1:m/2+mm1,n/2-mm1:n/2+mm1) = 0;
    fin = ifft2(ifftshift(ff2.*bandff));
    subplot(5,5,24); imshow(real(fin),[]), title('Bandpass')
    subplot(5,5,25); imshow(real(fin) + f1); title('High contrast: band')
end