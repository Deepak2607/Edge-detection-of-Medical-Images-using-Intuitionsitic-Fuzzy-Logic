
clear all;
clc;
A=[];
piA=[];

  II = imread('cameraman.tif');
%II = (imread('ct_liver2.png')); 
% III = imcrop(II,[80 30 240 200]);
 I = double(II);
 [r,k] = size(I);
 

 
 BW1 = edge(II,'Canny');
 %BW2 = imcrop(BW1,[80 30 240 200]);
 BW3 = double(BW1);
 
 BW4 = edge(II,'Sobel');
 
 %BW5 = imcrop(BW4,[80 30 240 200]);

     
 BW6 = double(BW4);
 
 




a=1.0, b= 0.7;
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
t15 = [b 0 0; b 0 a; a a b];
t16 = [0 0 b; 0 b a; b a a];


 




%t1 = [a a a; 0 0 0; b b b];
%t3 = [b b b; 0 0 0; a a a];
%t4 = [b a a; 0 b a; 0 0 b];
%t5 = [b a 0;b a 0; b a 0];
%t6 = [a 0 b;a 0 b; a 0 b];
%t7 = [0 0 0; b b b; a a a];
%t8 = [0 b a; 0 b a; 0 b a];
%t9 = [a a a; b b b;0 0 0]; 
%t10 = [a b 0; a b 0;a b 0];
%t11 = [0 0 0; a a a;b b b];
%t12 = [0 a b; 0 a b; 0 a b];
%t13 = [b b b; a a a; 0 0 0];
%t14 = [b 0 a; b 0 a; b 0 a];
%t15 = [b 0 0; b 0 a; a a b];
%t16 = [0 0 b; 0 b a; b a a];
xmax = max(max(max(I)));
fim = I/xmax;
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
bfim(r+2, k+2) =fim(r,k);
bfim(1,k+2) = fim(1,k);
bfim(r+2,1) = fim(r,1);

ci= 0.2;


pibfim = ci*(1-bfim);
c=0.4;
pit1 = c*(1-t1);pit2 = c*(1-t2);pit3 = c*(1-t3);pit4 = c*(1-t4);pit5 = c*(1-t5);pit6 = c*(1-t6);pit7 = c*(1-t7);
pit8 = c*(1-t8);pit9 = c*(1-t9);pit10 = c*(1-t10);pit11 = c*(1-t11);pit12 = c*(1-t12);pit13 = c*(1-t13);
pit14 = c*(1-t14);pit15 = c*(1-t15);pit16 = c*(1-t16);


     alp=.6
     for i = 2:r+1
        for j = 2:k+1
            A = [bfim(i-1,j-1) bfim(i,j-1) bfim(i+1,j-1) ; bfim(i-1,j) bfim(i,j) bfim(i+1,j) ; bfim(i-1,j+1) bfim(i,j+1) bfim(i+1,j+1)];
            piA = [pibfim(i-1,j-1) pibfim(i,j-1) pibfim(i+1,j-1) ; pibfim(i-1,j) pibfim(i,j) pibfim(i+1,j) ; pibfim(i-1,j+1) pibfim(i,j+1) pibfim(i+1,j+1)];


            d1 = (alp)*(2 - (1-A+t1).*exp(A-t1)-(1-t1+A).*exp(t1-A)+ 2- (1-(A-t1)+pit1-piA).*exp(A-t1-(pit1-piA))-(1-(pit1-piA)+A-t1).*exp(pit1-piA-(A-t1)));
            min1 =min(min(d1));
            d2 = (alp)* (2 - (1-A+t2).*exp(A-t2)-(1-t2+A).*exp(t2-A)+2-(1-(A-t2)+pit2-piA).*exp(A-t2-(pit2-piA))-(1-(pit2-piA)+A-t2).*exp(pit2-piA-(A-t2)));
            min2 =min(min(d2));
            d3 = (alp)* (2 - (1-A+t3).*exp(A-t3)-(1-t3+A).*exp(t3-A)+2-(1-(A-t3)+pit3-piA).*exp(A-t3-(pit3-piA))-(1-(pit3-piA)+A-t3).*exp(pit3-piA-(A-t3)));
            min3 =min(min(d3));
            d4 = (alp)*(2 - (1-A+t4).*exp(A-t4)-(1-t4+A).*exp(t4-A)+2-(1-(A-t4)+pit4-piA).*exp(A-t4-(pit4-piA))-(1-(pit4-piA)+A-t4).*exp(pit4-piA-(A-t4)));
            min4 =min(min(d4));
            d5 = (alp)*(2 - (1-A+t5).*exp(A-t5)-(1-t5+A).*exp(t5-A)+2-(1-(A-t5)+pit5-piA).*exp(A-t5-(pit5-piA))-(1-(pit5-piA)+A-t5).*exp(pit5-piA-(A-t5)));
            min5 =min(min(d5));
            d6 =(alp)*(2 - (1-A+t6).*exp(A-t6)-(1-t6+A).*exp(t6-A)+2-(1-(A-t6)+pit6-piA).*exp(A-t6-(pit6-piA))-(1-(pit6-piA)+A-t6).*exp(pit6-piA-(A-t6)));
            min6 =min(min(d6));
            d7 =(alp)* (2 - (1-A+t7).*exp(A-t7)-(1-t7+A).*exp(t7-A)+2-(1-(A-t7)+pit7-piA).*exp(A-t7-(pit7-piA))-(1-(pit7-piA)+A-t7).*exp(pit7-piA-(A-t7)));
            min7 =min(min(d7));
            d8 = (alp)*(2 - (1-A+t8).*exp(A-t8)-(1-t8+A).*exp(t8-A)+2-(1-(A-t8)+pit8-piA).*exp(A-t8-(pit8-piA))-(1-(pit8-piA)+A-t8).*exp(pit8-piA-(A-t8)));
            min8 =min(min(d8));
            d9 = (alp)*(2 - (1-A+t9).*exp(A-t9)-(1-t9+A).*exp(t9-A)+2-(1-(A-t9)+pit9-piA).*exp(A-t9-(pit9-piA))-(1-(pit9-piA)+A-t9).*exp(pit9-piA-(A-t9)));
            min9 =min(min(d9));
            d10 = (alp)*(2 - (1-A+t10).*exp(A-t10)-(1-t10+A).*exp(t10-A)+2-(1-(A-t10)+pit10-piA).*exp(A-t10-(pit10-piA))-(1-(pit10-piA)+A-t10).*exp(pit10-piA-(A-t10)));
            min10 =min(min(d10));
            d11 = (alp)*(2 - (1-A+t11).*exp(A-t11)-(1-t11+A).*exp(t11-A)+2-(1-(A-t11)+pit11-piA).*exp(A-t11-(pit11-piA))-(1-(pit11-piA)+A-t11).*exp(pit11-piA-(A-t11)));
            min11 =min(min(d11));
            d12 =(alp)*(2 - (1-A+t12).*exp(A-t12)-(1-t12+A).*exp(t12-A)+2-(1-(A-t12)+pit12-piA).*exp(A-t12-(pit12-piA))-(1-(pit12-piA)+A-t12).*exp(pit12-piA-(A-t12)));
            min12 =min(min(d12));
            d13 = (alp)*(2 - (1-A+t13).*exp(A-t13)-(1-t13+A).*exp(t13-A)+2-(1-(A-t13)+pit13-piA).*exp(A-t13-(pit13-piA))-(1-(pit13-piA)+A-t13).*exp(pit13-piA-(A-t13)));
            min13 =min(min(d13));
            d14 = (alp)* (2 - (1-A+t14).*exp(A-t14)-(1-t14+A).*exp(t14-A)+2-(1-(A-t14)+pit14-piA).*exp(A-t14-(pit14-piA))-(1-(pit14-piA)+A-t14).*exp(pit14-piA-(A-t14)));
            min14 =min(min(d14));
            d15 =  (alp)*(2 - (1-A+t15).*exp(A-t15)-(1-t15+A).*exp(t15-A)+2-(1-(A-t15)+pit15-piA).*exp(A-t15-(pit15-piA))-(1-(pit15-piA)+A-t15).*exp(pit15-piA-(A-t15)));
            min15 =min(min(d15));
            d16 =( alp)* (2 - (1-A+t16).*exp(A-t16)-(1-t16+A).*exp(t16-A)+2-(1-(A-t16)+pit16-piA).*exp(A-t16-(pit16-piA))-(1-(pit16-piA)+A-t16).*exp(pit16-piA-(A-t16)));
            min16 =min(min(d16));
            

            dd = [min1 min2 min3 min4 min5 min6 min7 min8 min9 min10 min11 min12 min13 min14 min15 min16];
            fedgeim(i-1,j-1) = max(dd);
        end

    end
 %   disp(fedgeim);

   % fedgeimmax = max(max(fedgeim));
   % edgeim = double((1/fedgeimmax)*(fedgeim));

    % figure, imshow(edgeimage);
    % figure, imshow(uint8(I));


   % tt = 255*edgeim;
   %ttt = uint8(tt);

    subplot(2,3,1),imshow(uint8(I))
    title('original image');
    %figure, imshow(ttt);


    for i = 1:r
        for j = 1:k
            
            if fedgeim(i,j)> 0.098
                ed(i,j) = 1;
            else
                ed(i,j) = 0;
            end
        end
    end
disp(ed);

   err_canny = immse(ed, BW3);
    %psnr_canny = psnr(BW3, I);
    subplot(2,3,2), imshow((BW3));
    title('Canny method');

 %   err_sobel = immse(BW6, I);
    %psnr_sobel = psnr(BW6, I);
    subplot(2,3,3), imshow(BW6);
    title('Sobel method');
  %  fprintf('\n The mean-squared error is %0.4f\n', err_sobel);


    subplot(2,3,4),imshow(fedgeim)
    title({'Result from Chaira method';'a=0.3, b=0.8, c=0.2'});

   % err_ed= immse(ed, I);
    %psnr_ed= psnr(ed, I);
    subplot(2,3,5),imshow(ed);
   % title('After applying threshold 45 on result');
    fprintf('\n The mean-squared error is %0.4f\n', err_canny);


    %med = bwmorph(ed,'thin');
    %subplot(2,3,6), imshow(med);
    %title('after applying morphological thin fun');

    %err = immse(BW3, ed);
    %fprintf('\n The mean-squared error is %0.4f\n', err););
    
    

    
    
