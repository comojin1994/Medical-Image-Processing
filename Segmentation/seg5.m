function fseg = seg5(f, hmin, hmax, vmin, vmax, th, val)
  [ix iy] = size(f);
  fseg = f;
  
  roi = f(hmin:hmax, vmin:vmax);
  m = mean(roi(:));
  s = std(double(roi(:)));
  
  for i=1:ix
    for j=1:iy
      if f(i,j) > m-th*s && f(i,j) < m+th*s
        fseg(i,j) = val;
      end
    end
  end
end
