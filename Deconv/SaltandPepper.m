function output = SaltandPepper(path, value)
    img = imread(path);
    img = imnoise(img, 'salt & pepper', value);
    output = img;
end