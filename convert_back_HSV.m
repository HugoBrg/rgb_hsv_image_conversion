%read the original image
original = imread('test_9.png');

%read the file that contains the processed values
newImage = uint8(importdata('capture.txt'));

%recreate the image and display it
newImage = reshape(newImage, [size(original,1),size(original,2),1]);
imshow(newImage);
