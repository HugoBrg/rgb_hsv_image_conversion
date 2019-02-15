%read the image
I = imread('test_7.png');

%Extract RED, GREEN and BLUE components from the image
R = I(:,:,1);			
G = I(:,:,2);
B = I(:,:,3);

%make the numbers to be of double format
R = double(R);	
G = double(G);
B = double(B);

%Raise each member of the component by appropriate value. 
R = R.^(3/8); % 8 bits -> 3 bits
G = G.^(3/8); % 8 bits -> 3 bits
B = B.^(1/4); % 8 bits -> 2 bits

%tranlate to integer
R = uint8(R); % float -> uint8
G = uint8(G);
B = uint8(B);

%minus one cause sometimes conversion to integers rounds up the numbers wrongly
R = R-1; % 3 bits -> max value is 111 (bin) -> 7 (dec)(hex)
G = G-1;
B = B-1; % 11 (bin) -> 3 (dec)(hex)

%shift bits and construct one Byte from 3 + 3 + 2 bits
G = bitshift(G, 3); % 3 << G (shift by 3 bits)
B = bitshift(B, 6); % 6 << B (shift by 6 bits)
COLOR = R+G+B;      % R + 3 << G + 6 << B

%open the files where our image values will be written
dec = fopen ('dec.txt', 'w');
hex = fopen ('hex.txt', 'w');

for i = 1:size(COLOR(:), 1)
     fprintf (hex, '%s ', dec2hex(COLOR(i))); % COLOR (dec) -> print to file (hex)
     fprintf (dec, '%d ', COLOR(i)); % COLOR (dec) -> print to file (hex)
end

fclose (dec);
fclose (hex);
