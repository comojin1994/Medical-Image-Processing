function fseg = seg4(f, th1, th2, val)
  [ix iy] = size(f);
  fseg = f;
  
  if th1 > th2
    tmp = th2; th2=th1; th1=tmp;
  end
  
  for i=1:ix
    for j=1:iy
      if f(i,j) > th1 && f(i,j) < th2
        fseg(i,j) = val;
      end
    end
  end
end
