function Do(path, value)
   img = SaltandPepper(path, value);
   fmax = ordfilt2(img, 9, true(3));
   fmin = ordfilt2(img, 1, true(3));
   fmed = ordfilt2(img, 4, true(3));
   fran = fmax - fmin;
   fmedran = ordfilt2(fmed, 9, true(3)) - ordfilt2(fmed, 1, true(3));
   
   
   figure;
   subplot(2,3,1); imshow(img); title('Salt & Pepper');
   subplot(2,3,2); imshow(fmax); title('Max');
   subplot(2,3,3); imshow(fmin); title('Min');
   subplot(2,3,4); imshow(fmed); title('Med');
   subplot(2,3,5); imshow(fran); title('Range');
   subplot(2,3,6); imshow(fmedran); title('Med-Range');
   
end