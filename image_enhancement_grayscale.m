
clear all;
clc;
A=[];
piA=[];


 III = rgb2gray(imread('rice.tif'));
 II = imcrop(III,[80 30 240 200]);
 I = double(II);
 xmax = max(max(max(I)));
 fim = I/xmax;
 
 
 canny_III = edge(III,'Canny');
 canny_II = imcrop(canny_III,[80 30 240 200]);
 canny_I = double(canny_II);
 canny_max = max(max(max(canny_I)));
 canny_fim = canny_I/canny_max;
 
 
 sobel_III = edge(III,'Sobel');
 sobel_II = imcrop(sobel_III,[80 30 240 200]);
 sobel_I = double(sobel_II);
 sobel_max = max(max(max(sobel_I)));
 sobel_fim = sobel_I/sobel_max;
 
 
%cameraman3.jpg
%a=0.65; b=0.9;
%threshold= 45/255;

%peppers.png
%a=0.45; b=0.9;
%threshold=45/255;


%bt_ctscan3.jpg
%a=0.8; b=0.99; 
%threshold =45/255;

%bt_ctscan7.jpg
%a=0.85; b=0.9; 
%threshold =35/255;

%bt_ctscan8.jpg
%a=0.7; b=0.9;
%threshold =45/255;

%ct_liver.png
%a=0.8; b=0.95;
%threshold =45/255;

%ct_liver3.jpg
%a=0.85; b=0.95;
%threshold =45/255;

%ct_liver4.jpg
%a=0.82; b=0.9;
%threshold =45/255;

%rice.tif
a=0.3; b=0.8;
threshold =0.9;




t1 = [a a a; 0 0 -1; b b b];
t2 = [a a b; a b 0; b 0 0];
t3 = [b b b; 0 0 0; a a a];
t4 = [b a a; 0 b a; 0 0 b];
t5 = [b a 0;b a 0; b a 0];
t6 = [a 0 b;a 0 b; a 0 b];
t7 = [0 0 0; b b b; a a a];
t8 = [0 b a; 0 b a; 0 b a];
t9 = [a a a; b b b;0 0 0]; 
t10 = [a b 0; a b 0;a b 0];
t11 = [0 0 0; a a a;b b b];
t12 = [0 a b; 0 a b; 0 a b];
t13 = [b b b; a a a; 0 0 0];
t14 = [b 0 a; b 0 a; b 0 a];
t15 = [b 0 0; b 0 a; a a b];
t16 = [0 0 b; 0 b a; b a a];




[r,k] = size(I);
fedgeim = zeros(r,k);
r1 = fim(2,:);
r2 = fim(r-1,:);
c1 = fim(:,2);
c2 = fim(:,k-1);
b1 = [0 r1 0];
b2 = [0 r2 0];
b3 = [c1 fim c2];
bfim = [b1;b3;b2];
bfim(1,1) = fim(1,1);
bfim(r+2, k+2) = fim(r,k);
bfim(1,k+2) = fim(1,k);
bfim(r+2,1) = fim(r,1);

c= 0.2;
pibfim = c*(1-bfim);
pit1 = c*(1-t1);pit2 = c*(1-t2);pit3 = c*(1-t3);pit4 = c*(1-t4);pit5 = c*(1-t5);pit6 = c*(1-t6);pit7 = c*(1-t7);
pit8 = c*(1-t8);pit9 = c*(1-t9);pit10 = c*(1-t10);pit11 = c*(1-t11);pit12 = c*(1-t12);pit13 = c*(1-t13);
pit14 = c*(1-t14);pit15 = c*(1-t15);pit16 = c*(1-t16);


alpha= 0.8;
for i = 2:r+1
    for j = 2:k+1
        A = [bfim(i-1,j-1) bfim(i,j-1) bfim(i+1,j-1) ; bfim(i-1,j) bfim(i,j) bfim(i+1,j) ; bfim(i-1,j+1) bfim(i,j+1) bfim(i+1,j+1)];
        piA = [pibfim(i-1,j-1) pibfim(i,j-1) pibfim(i+1,j-1) ; pibfim(i-1,j) pibfim(i,j) pibfim(i+1,j) ; pibfim(i-1,j+1) pibfim(i,j+1) pibfim(i+1,j+1)];


        d1 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t1 + t1*t1 +(1-t1)*(1-t1))/3));
        min1 =min(min(d1));
        d2 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t2 + t2*t2 +(1-t2)*(1-t2))/3));
        min2 =min(min(d2));
        d3 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t3 + t3*t3 +(1-t3)*(1-t3))/3));
        min3 =min(min(d3));
        d4 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t4 + t4*t4 +(1-t4)*(1-t4))/3));
        min4 =min(min(d4));
        d5 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t5 + t5*t5 +(1-t5)*(1-t5))/3));
        min5 =min(min(d5));
        d6 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t6 + t6*t6 +(1-t6)*(1-t6))/3));
        min6 =min(min(d6));
        d7 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t7 + t7*t7 +(1-t7)*(1-t7))/3));
        min7 =min(min(d7));
        d8 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t8 + t8*t8 +(1-t8)*(1-t8))/3));
        min8 =min(min(d8));
        d9 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t9 + t9*t9 +(1-t9)*(1-t9))/3));
        min9 =min(min(d9));
        d10 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t10 + t10*t10 +(1-t10)*(1-t10))/3));
        min10 =min(min(d10));
        d11 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t11 + t11*t11 +(1-t11)*(1-t11))/3));
        min11 =min(min(d11));
        d12 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t12 + t12*t12 +(1-t12)*(1-t12))/3));
        min12 =min(min(d12));
        d13 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t13 + t13*t13 +(1-t13)*(1-t13))/3));
        min13 =min(min(d13));
        d14 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t14 + t14*t14 +(1-t14)*(1-t14))/3));
        min14 =min(min(d14));
        d15 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t15 + t15*t15 +(1-t15)*(1-t15))/3));
        min15 =min(min(d15));
        d16 = alpha*(1-3/4*abs((2*A + A*A +(1-A)*(1-A))/3-(2*t16 + t16*t16 +(1-t16)*(1-t16))/3));
        min16 =min(min(d16));

        dd = [min1 min2 min3 min4 min5 min6 min7 min8 min9 min10 min11 min12 min13 min14 min15 min16];
        fedgeim(i-1,j-1) = max(dd);
    end

end

fedgeimmax = max(max(fedgeim));
edgeim = double((1/fedgeimmax)*(fedgeim));

% figure, imshow(edgeimage);
% figure, imshow(uint8(I));


tt = edgeim;
%ttt = uint8(tt);
subplot(2,3,1),imshow(uint8(I))
title('original image');


for i = 1:r
    for j = 1:k
        if  tt(i,j)<threshold
            ed(i,j) = 255;
        else
            ed(i,j) = 0;
        end
    end
end


err_canny = immse(canny_fim, canny_fim);
psnr_canny = psnr(canny_fim, canny_fim);
subplot(2,3,2), imshow(canny_I);
title('Canny method');
fprintf('\n The mean-squared error is %6.4f\n', err_canny);
fprintf(' psnr is %6.4f\n', psnr_canny);


err_sobel = immse(sobel_fim, canny_fim);
psnr_sobel = psnr(sobel_fim, canny_fim);
subplot(2,3,3), imshow(sobel_I);
title('Sobel method');
fprintf('\n The mean-squared error is %6.4f\n', err_sobel);
fprintf(' psnr is %6.4f\n', psnr_sobel);


subplot(2,3,4),imshow(tt)
title({'method2'});


err_tt= immse(tt, canny_fim);
psnr_tt= psnr(tt, canny_fim);
subplot(2,3,5),imshow(ed);
title('After applying threshold on result');
fprintf('\n The mean-squared error is %6.4f\n', err_tt);
fprintf(' psnr is %6.4f\n', psnr_tt);




%med = bwmorph(ed,'thin');
%subplot(2,3,6), imshow(med);
%title('after applying morphological thin fun');

%err = immse(BW3, ed);
%fprintf('\n The mean-squared error is %0.4f\n', err);