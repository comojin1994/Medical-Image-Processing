function output = SaltandPepper(img, value)
    img = imnoise(img, 'salt & pepper', value);
    output = img;
end