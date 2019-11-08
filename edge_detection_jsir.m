
clear;
clc;
A=[];
piA=[];

III = rgb2gray(imread('rice.tif'));
II = imcrop(III,[80 30 240 200]);
I = double(II);
[r,k] = size(I);


a=0.3; b=0.8;
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
bfim(r+2, k+2) = fim(r,k);
bfim(1,k+2) = fim(1,k);
bfim(r+2,1) = fim(r,1);


c= 0.2;
pibfim = c*(1-bfim);
pit1 = c*(1-t1);pit2 = c*(1-t2);pit3 = c*(1-t3);pit4 = c*(1-t4);pit5 = c*(1-t5);pit6 = c*(1-t6);pit7 = c*(1-t7);
pit8 = c*(1-t8);pit9 = c*(1-t9);pit10 = c*(1-t10);pit11 = c*(1-t11);pit12 = c*(1-t12);pit13 = c*(1-t13);
pit14 = c*(1-t14);pit15 = c*(1-t15);pit16 = c*(1-t16);


for i = 2:r+1
    for j = 2:k+1
        A = [bfim(i-1,j-1) bfim(i,j-1) bfim(i+1,j-1) ; bfim(i-1,j) bfim(i,j) bfim(i+1,j) ; bfim(i-1,j+1) bfim(i,j+1) bfim(i+1,j+1)];
        piA = [pibfim(i-1,j-1) pibfim(i,j-1) pibfim(i+1,j-1) ; pibfim(i-1,j) pibfim(i,j) pibfim(i+1,j) ; pibfim(i-1,j+1) pibfim(i,j+1) pibfim(i+1,j+1)];
        
        
        d1= (exp((a-1).*((A.*log(A/(A+t1).*0.5))+ (piA.*log(piA/(piA+pit1).*0.5))))+ exp((a-1).*((t1.*log(t1/(t1+A).*0.5))+(pit1.*log(pit1/(pit1+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min1 =min(min(d1));
        d2= (exp((a-1).*((A.*log(A/(A+t2).*0.5))+ (piA.*log(piA/(piA+pit2).*0.5))))+ exp((a-1).*((t2.*log(t2/(t2+A).*0.5))+(pit2.*log(pit2/(pit2+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min2 =min(min(d2));
        d3 = (exp((a-1).*((A.*log(A/(A+t3).*0.5))+ (piA.*log(piA/(piA+pit3).*0.5))))+ exp((a-1).*((t3.*log(t3/(t3+A).*0.5))+(pit3.*log(pit3/(pit3+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min3 =min(min(d3));
        d4 = (exp((a-1).*((A.*log(A/(A+t4).*0.5))+ (piA.*log(piA/(piA+pit4).*0.5))))+ exp((a-1).*((t4.*log(t4/(t4+A).*0.5))+(pit4.*log(pit4/(pit4+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min4 =min(min(d4));
        d5 = (exp((a-1).*((A.*log(A/(A+t5).*0.5))+ (piA.*log(piA/(piA+pit5).*0.5))))+ exp((a-1).*((t5.*log(t5/(t5+A).*0.5))+(pit5.*log(pit5/(pit5+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min5 =min(min(d5));
        d6 = (exp((a-1).*((A.*log(A/(A+t6).*0.5))+ (piA.*log(piA/(piA+pit6).*0.5))))+ exp((a-1).*((t6.*log(t6/(t6+A).*0.5))+(pit6.*log(pit6/(pit6+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min6 =min(min(d6));
        d7 = (exp((a-1).*((A.*log(A/(A+t7).*0.5))+ (piA.*log(piA/(piA+pit7).*0.5))))+ exp((a-1).*((t7.*log(t7/(t7+A).*0.5))+(pit7.*log(pit7/(pit7+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min7 =min(min(d7));
        d8 = (exp((a-1).*((A.*log(A/(A+t8).*0.5))+ (piA.*log(piA/(piA+pit8).*0.5))))+ exp((a-1).*((t8.*log(t8/(t8+A).*0.5))+(pit8.*log(pit8/(pit8+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min8 =min(min(d8));
        d9 = (exp((a-1).*((A.*log(A/(A+t9).*0.5))+ (piA.*log(piA/(piA+pit9).*0.5))))+ exp((a-1).*((t9.*log(t9/(t9+A).*0.5))+(pit9.*log(pit9/(pit9+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min9 =min(min(d9));
        d10 =(exp((a-1).*((A.*log(A/(A+t10).*0.5))+ (piA.*log(piA/(piA+pit10).*0.5))))+ exp((a-1).*((t10.*log(t10/(t10+A).*0.5))+(pit10.*log(pit10/(pit10+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min10 =min(min(d10));
        d11 = (exp((a-1).*((A.*log(A/(A+t11).*0.5))+ (piA.*log(piA/(piA+pit11).*0.5))))+ exp((a-1).*((t11.*log(t11/(t11+A).*0.5))+(pit11.*log(pit11/(pit11+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min11 =min(min(d11));
        d12 = (exp((a-1).*((A.*log(A/(A+t12).*0.5))+ (piA.*log(piA/(piA+pit12).*0.5))))+ exp((a-1).*((t12.*log(t12/(t12+A).*0.5))+(pit12.*log(pit12/(pit12+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min12 =min(min(d12));
        d13 = (exp((a-1).*((A.*log(A/(A+t13).*0.5))+ (piA.*log(piA/(piA+pit13).*0.5))))+ exp((a-1).*((t13.*log(t13/(t13+A).*0.5))+(pit13.*log(pit13/(pit13+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min13 =min(min(d13));
        d14 = (exp((a-1).*((A.*log(A/(A+t14).*0.5))+ (piA.*log(piA/(piA+pit14).*0.5))))+ exp((a-1).*((t14.*log(t14/(t14+A).*0.5))+(pit14.*log(pit14/(pit14+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min14 =min(min(14));
        d15 = (exp((a-1).*((A.*log(A/(A+t15).*0.5))+ (piA.*log(piA/(piA+pit15).*0.5))))+ exp((a-1).*((t15.*log(t15/(t15+A).*0.5))+(pit15.*log(pit15/(pit15+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min15 =min(min(d15));
        d16 = (exp((a-1).*((A.*log(A/(A+t16).*0.5))+ (piA.*log(piA/(piA+pit16).*0.5))))+ exp((a-1).*((t16.*log(t16/(t16+A).*0.5))+(pit16.*log(pit16/(pit16+piA).*0.5))))- 2)/((2.^(a-1))-1);
        min16 =min(min(d16));
        
        dd = [min1 min2 min3 min4 min5 min6 min7 min8 min9 min10 min11 min12 min13 min14 min15 min16];
        fedgeim(i-1,j-1) = max(dd);
    end
end
fedgeimmax = max(max(fedgeim));
edgeim = double((1/fedgeimmax)*(fedgeim));

 
tt = 255*edgeim;
ttt = uint8(tt);
subplot(2,2,1),imshow(uint8(I))
title('original image');
subplot(2,2,2),imshow(ttt)
title('Edge without threshold'); 
for i = 1:r
    for j = 1:k
        if ttt(i,j)>45 
            ed(i,j) = 255;
        else
            ed(i,j) = 0;
        end
    end
end
subplot(2,2,3),imshow(ed);
title('After applying threshold 45');
med = bwmorph(ed,'thin');
subplot(2,2,4), imshow(med);
title('after applying morphological thin fun');
