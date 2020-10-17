function Do
    f = imread('example.jpeg');
    f1 = mat2gray(f);
    figure;
    subplot(3,3,1); imshow(f1); title('Original')
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
    subplot(3,3,2); imshow(lowff); title('Lowpass Filter')
    
    subplot(3,3,3);
    fin = ifft2(ifftshift(ff2.*lowff));
    imshow(real(fin),[]); title('Lowpass Result')
    
    subplot(3,3,4);
    highff = 1 - lowff;
    imshow(highff); title('Highpass Filter')
    
    subplot(3,3,5);
    fin = ifft2(ifftshift(ff2.*highff));
    imshow(real(fin),[]); title('Highpass Result')
    
    subplot(3,3,6);
    imshow(real(fin) + f1); title('High contrast')
    
    mm2 = 140; mm1 = 10;
    bandff = zeros(size(ff2));
    bandff(m/2-mm2:m/2+mm2,n/2-mm2:n/2+mm2) = 1;
    bandff(m/2-mm1:m/2+mm1,n/2-mm1:n/2+mm1) = 0;
    subplot(3,3,7); imshow(bandff); title('Bandpass filter')
    
    subplot(3,3,8);
    fin = ifft2(ifftshift(ff2.*bandff));
    imshow(real(fin),[]), title('Bandpass Result')
    
    subplot(3,3,9)
    imshow(real(fin) + f1); title('High contrast: band')
    
end