
clear all;
clc;
A=[];
piA=[];


 III = rgb2gray(imread('peppers.png'));
 %II = imcrop(III,[80 30 240 200]);
 I = double(III);
 xmax = max(max(max(I)));
 fim = I/xmax;
 
 %gth_1= rgb2gray(imread('bt_ctscan7.jpg'));
 %gth_2 = imcrop(gth_1,[80 30 240 200]);
 %gth_3= double(gth_1);
 
 canny_III = edge(III,'Canny');
 %canny_II = imcrop(canny_III,[80 30 240 200]);
 canny_I = double(canny_III);
 canny_max = max(max(max(canny_I)));
 canny_fim = canny_I/canny_max;
 
 
 sobel_III = edge(III,'Sobel');
 %sobel_II = imcrop(sobel_III,[80 30 240 200]);
 sobel_I = double(sobel_III);
 sobel_max = max(max(max(sobel_I)));
 sobel_fim = sobel_I/sobel_max;
 
 
%cameraman3.jpg
%a=0.65; b=0.9;
%threshold= 45/255;

%peppers.png
a=0.45; b=0.9;
threshold=45/255;



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
%a=0.3; b=0.8;
%threshold =45/255;

c=0.9; b_2=0.99;
t1 = [a a a; 0 0 0; b b b];
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
t15 = [b 0 0; a b 0; a a b];
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


pibfim = c*(1-bfim);
pit1 = c*(1-t1);pit2 = c*(1-t2);pit3 = c*(1-t3);pit4 = c*(1-t4);pit5 = c*(1-t5);pit6 = c*(1-t6);pit7 = c*(1-t7);
pit8 = c*(1-t8);pit9 = c*(1-t9);pit10 = c*(1-t10);pit11 = c*(1-t11);pit12 = c*(1-t12);pit13 = c*(1-t13);
pit14 = c*(1-t14);pit15 = c*(1-t15);pit16 = c*(1-t16);


for i = 2:r+1
    for j = 2:k+1
        A = [bfim(i-1,j-1) bfim(i,j-1) bfim(i+1,j-1) ; bfim(i-1,j) bfim(i,j) bfim(i+1,j) ; bfim(i-1,j+1) bfim(i,j+1) bfim(i+1,j+1)];
        piA = [pibfim(i-1,j-1) pibfim(i,j-1) pibfim(i+1,j-1) ; pibfim(i-1,j) pibfim(i,j) pibfim(i+1,j) ; pibfim(i-1,j+1) pibfim(i,j+1) pibfim(i+1,j+1)];
        
        
        e_a_1= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_1= (1- ((t1+pit1).^b_2).*exp(1- ((t1+pit1).^b_2)))/9;
        e_ab_1 = (1- (((A+t1+piA+pit1)/2).^b_2).*exp(1- (((A+t1+piA+pit1)/2).^b_2)))/9;
        d1= (e_a_1+e_b_1)/2 - e_ab_1; 
        min1 =min(min(d1));
        
        e_a_2= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_2= (1- ((t2+pit2).^b_2).*exp(1- ((t2+pit2).^b_2)))/9;
        e_ab_2 = (1- (((A+t2+piA+pit2)/2).^b_2).*exp(1- (((A+t2+piA+pit2)/2).^b_2)))/9;
        d2= (e_a_2+e_b_2)/2 - e_ab_2; 
        min2 =min(min(d2));
        
        e_a_3= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_3= (1- ((t3+pit3).^b_2).*exp(1- ((t3+pit3).^b_2)))/9;
        e_ab_3 = (1- (((A+t3+piA+pit3)/2).^b_2).*exp(1- (((A+t3+piA+pit3)/2).^b_2)))/9;
        d3= (e_a_3+e_b_3)/2 - e_ab_3; 
        min3 =min(min(d3));
        
        e_a_4= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_4= (1- ((t4+pit4).^b_2).*exp(1- ((t4+pit4).^b_2)))/9;
        e_ab_4 = (1- (((A+t4+piA+pit4)/2).^b_2).*exp(1- (((A+t4+piA+pit4)/2).^b_2)))/9;
        d4= (e_a_4+e_b_4)/2 - e_ab_4; 
        min4 =min(min(d4));
        
        e_a_5= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_5= (1- ((t5+pit5).^b_2).*exp(1- ((t5+pit5).^b_2)))/9;
        e_ab_5 = (1- (((A+t5+piA+pit5)/2).^b_2).*exp(1- (((A+t5+piA+pit5)/2).^b_2)))/9;
        d5= (e_a_5+e_b_5)/2 - e_ab_5; 
        min5 =min(min(d5));
        
        e_a_6= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_6= (1- ((t6+pit6).^b_2).*exp(1- ((t6+pit6).^b_2)))/9;
        e_ab_6 = (1- (((A+t6+piA+pit6)/2).^b_2).*exp(1- (((A+t6+piA+pit6)/2).^b_2)))/9;
        d6= (e_a_6+e_b_6)/2 - e_ab_6; 
        min6 =min(min(d6));
        
        e_a_7= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_7= (1- ((t7+pit7).^b_2).*exp(1- ((t7+pit7).^b_2)))/9;
        e_ab_7 = (1- (((A+t7+piA+pit7)/2).^b_2).*exp(1- (((A+t7+piA+pit7)/2).^b_2)))/9;
        d7= (e_a_7+e_b_7)/2 - e_ab_7; 
        min7 =min(min(d7));
        
        e_a_8= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_8= (1- ((t8+pit8).^b_2).*exp(1- ((t8+pit8).^b_2)))/9;
        e_ab_8 = (1- (((A+t8+piA+pit8)/2).^b_2).*exp(1- (((A+t8+piA+pit8)/2).^b_2)))/9;
        d8= (e_a_8+e_b_8)/2 - e_ab_8; 
        min8 =min(min(d8));
        
        e_a_9= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_9= (1- ((t9+pit9).^b_2).*exp(1- ((t9+pit9).^b_2)))/9;
        e_ab_9 = (1- (((A+t9+piA+pit9)/2).^b_2).*exp(1- (((A+t9+piA+pit9)/2).^b_2)))/9;
        d9= (e_a_9+e_b_9)/2 - e_ab_9; 
        min9 =min(min(d9));
        
        e_a_10= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_10= (1- ((t10+pit10).^b_2).*exp(1- ((t10+pit10).^b_2)))/9;
        e_ab_10 = (1- (((A+t10+piA+pit10)/2).^b_2).*exp(1- (((A+t10+piA+pit10)/2).^b_2)))/9;
        d10= (e_a_10+e_b_10)/2 - e_ab_10;
        min10 =min(min(d10));
        
        e_a_11= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_11= (1- ((t11+pit11).^b_2).*exp(1- ((t11+pit11).^b_2)))/9;
        e_ab_11 = (1- (((A+t11+piA+pit11)/2).^b_2).*exp(1- (((A+t11+piA+pit11)/2).^b_2)))/9;
        d11= (e_a_11+e_b_11)/2 - e_ab_11;
        min11 =min(min(d11));
        
        e_a_12= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_12= (1- ((t12+pit12).^b_2).*exp(1- ((t12+pit12).^b_2)))/9;
        e_ab_12 = (1- (((A+t12+piA+pit12)/2).^b_2).*exp(1- (((A+t12+piA+pit12)/2).^b_2)))/9;
        d12= (e_a_12+e_b_12)/2 - e_ab_12; 
        min12 =min(min(d12));
        
        e_a_13= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_13= (1- ((t13+pit13).^b_2).*exp(1- ((t13+pit13).^b_2)))/9;
        e_ab_13 = (1- (((A+t13+piA+pit13)/2).^b_2).*exp(1- (((A+t13+piA+pit13)/2).^b_2)))/9;
        d13= (e_a_13+e_b_13)/2 - e_ab_13; 
        min13 =min(min(d13));
        
        e_a_14= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_14= (1- ((t14+pit14).^b_2).*exp(1- ((t14+pit14).^b_2)))/9;
        e_ab_14 = (1- (((A+t14+piA+pit14)/2).^b_2).*exp(1- (((A+t14+piA+pit14)/2).^b_2)))/9;
        d14= (e_a_14+e_b_14)/2 - e_ab_14;
        min14 =min(min(d14));
        
        e_a_15= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_15= (1- ((t15+pit15).^b_2).*exp(1- ((t15+pit15).^b_2)))/9;
        e_ab_15 = (1- (((A+t15+piA+pit15)/2).^b_2).*exp(1- (((A+t15+piA+pit15)/2).^b_2)))/9;
        d15= (e_a_15+e_b_15)/2 - e_ab_15; 
        min15 =min(min(d15));
        
        e_a_16= (1- ((A+piA).^b_2).*exp(1- ((A+piA).^b_2)))/9;
        e_b_16= (1- ((t16+pit16).^b_2).*exp(1- ((t16+pit16).^b_2)))/9;
        e_ab_16 = (1- (((A+t16+piA+pit16)/2).^b_2).*exp(1- (((A+t16+piA+pit16)/2).^b_2)))/9;
        d16= (e_a_16+e_b_16)/2 - e_ab_16; 
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
        if  tt(i,j)>threshold
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
title('After applying threshold 45 on result');
fprintf('\n The mean-squared error is %6.4f\n', err_tt);
fprintf(' psnr is %6.4f\n', psnr_tt);



med = bwmorph(ed,'thin');
subplot(2,3,6), imshow(med);
title('after applying morphological thin fun');

%err = immse(BW3, ed);
%fprintf('\n The mean-squared error is %0.4f\n', err);