%read the image
original = imread('test_7.png');
subplot(2,2,1), imshow(original);

%convert the image into a greyscale image
Igrey = rgb2gray(original);
subplot(2,2,2), imshow(Igrey);

%open the files where our image values will be written
dec = fopen ('dec.txt', 'w');
hex = fopen ('hex.txt', 'w');

%read the values of our black and white image
for y = 1:size(Igrey,1)
    for x = 1:size(Igrey,2)
        %write de value of our pixel into our files
        i = Igrey(x,y);
        fprintf (dec, '%d ',i); % COLOR (dec) -> print to file (hex)
        fprintf (hex, '%d ',dec2hex(i)); % COLOR (dec) -> print to file (hex)
    end
end

fclose (dec);
fclose (hex);