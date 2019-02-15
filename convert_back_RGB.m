%read the image
original = imread('test_7.png');

%display the original image
figure('Name','Original and Extracted image');
subplot(2,2,1), imshow(original); 

%open the file that contains the value of the image
dec = fopen('dec.txt','r'); 
formatSpec = '%d';
dec_tab = fscanf(dec,formatSpec);
fclose(dec);

%identify the size of the image
dec_tab_size = size(dec_tab);
dec_tab_size = dec_tab_size(1);

for i = 1:dec_tab_size
    %extract each color of the byte
    R = bitget(dec_tab(i),1:3);
    G = bitget(dec_tab(i),4:6);
    B = bitget(dec_tab(i),7:8);
    
    %we do the reverse operations to extract 
    %the RGB compressed values from the pixel and reconstruct the pixel
    R2 = (R(3)*4)+(R(2)*2)+(R(1)*1);
    G2 = (G(3)*32)+(G(2)*16)+(G(1)*8);
    B2 = (B(2)*128)+(B(1)*64);

    R2 = double(R2);	
    G2 = double(G2);
    B2 = double(B2);

    R2 = R2+1;
    G2 = G2/8+1;
    B2 = B2/64+1;

    R2 = R2.^(8/3);
    G2 = G2.^(8/3);
    B2 = B2.^(4/1);

    R2 = uint8(R2);
    G2 = uint8(G2);
    B2 = uint8(B2);

    C1(i) = R2;
    %C2(i) = G2;
    C3(i) = B2;
    C2(i) = 0;
end

%concatenate the arrays
extracted=cat(3,C1,C2,C3);

%recreate the image and display it
extracted=reshape(extracted,[200,200,3]);
subplot(2,2,2), imshow(extracted);
