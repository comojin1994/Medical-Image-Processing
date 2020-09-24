function fseg = seg1(f, th, val)
  [ix iy] = size(f);
  fseg = f;
  for i=1:ix
    for j=1:iy
      if f(i,j) < th
        fseg(i,j) = val;
      end
    end
  end
end
