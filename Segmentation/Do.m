function Do()
  f = imread('../example.jpeg');
  f = f(:,:,1);
  
  fseg1 = seg1(f,180,0);
  fseg2 = seg2(f,180,255);
  fseg3 = seg3(f,210,240,0);
  fseg4 = seg4(f,210,240,255);
  fseg5 = seg5(f,100,200,150,250,1,255);
  
  figure;
  subplot(2,3,1);imshow(f);
  subplot(2,3,2);imshow(fseg1);
  subplot(2,3,3);imshow(fseg2);
  subplot(2,3,4);imshow(fseg3);
  subplot(2,3,5);imshow(fseg4);
  subplot(2,3,6);imshow(fseg5);
end
