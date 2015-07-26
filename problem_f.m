%Form Modified Covariance PSD estimates. Use model orders of 5, 15, and 30.

clear all
clc
load 'mydata';
set(0,'DefaultAxesFontSize',40);
set(0,'DefaultLineLinewidth',4);

N = 128;
FM = 4096;
fs = 64;
ws = 2*pi/(FM);

wnorm = -pi:ws:pi;
winnorm = wnorm(1:FM);
w = winnorm/(2*pi)*fs;



P = 5;
n = P;
y = data1;
r=zeros(n+1,1);
for i = 0 : n,
   r(i+1)=y(1:N-i)'*y(i+1:N)/N;
end
%r = xcorr(data1,'biased');
% form the y vector and Y matrix given in equation (3.4.14)
% with the first and the last n rows removed

Y1=toeplitz(y(n:N-1),y(n:-1:1).');

y1=[y(n+1:N)];
T = [y1,Y1];
TT=fliplr(T);
Y2 = TT(:,2:end);
y2 = TT(:,1);
% compute the AR coffecients
%a= -inv(Y1'*Y1)*Y1'*y1;

Y=[Y1;Y2];

yy = [y1;y2];

a = -Y\yy;


% compute the noise variance
sig2=norm(Y*a+yy)^2/(N-n)/2;

a=[1;a];

[h v] = freqz(1,a,FM,fs,'whole');

figure(1)
plot(w,db(abs(fftshift(h)).^2*sig2/N));

title('Modified Covariance PSD estimates of un-noised data of p=5', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;





P = 15;
n = P;
y = data1;
r=zeros(n+1,1);
for i = 0 : n,
   r(i+1)=y(1:N-i)'*y(i+1:N)/N;
end
%r = xcorr(data1,'biased');
% form the y vector and Y matrix given in equation (3.4.14)
% with the first and the last n rows removed

Y1=toeplitz(y(n:N-1),y(n:-1:1).');

y1=[y(n+1:N)];
T = [y1,Y1];
TT=fliplr(T);
Y2 = TT(:,2:end);
y2 = TT(:,1);
% compute the AR coffecients
%a= -inv(Y1'*Y1)*Y1'*y1;

Y=[Y1;Y2];

yy = [y1;y2];

a = -Y\yy;


% compute the noise variance
sig2=norm(Y*a+yy)^2/(N-n)/2;

a=[1;a];

[h v] = freqz(1,a,FM,fs,'whole');

figure(2)
plot(w,db(abs(fftshift(h)).^2*sig2/N));

title('Modified Covariance PSD estimates of un-noised data of p=15', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



P = 30;
n = P;
y = data1;
r=zeros(n+1,1);
for i = 0 : n,
   r(i+1)=y(1:N-i)'*y(i+1:N)/N;
end
%r = xcorr(data1,'biased');
% form the y vector and Y matrix given in equation (3.4.14)
% with the first and the last n rows removed

Y1=toeplitz(y(n:N-1),y(n:-1:1).');

y1=[y(n+1:N)];
T = [y1,Y1];
TT=fliplr(T);
Y2 = TT(:,2:end);
y2 = TT(:,1);
% compute the AR coffecients
%a= -inv(Y1'*Y1)*Y1'*y1;

Y=[Y1;Y2];

yy = [y1;y2];

a = -Y\yy;


% compute the noise variance
sig2=norm(Y*a+yy)^2/(N-n)/2;

a=[1;a];

[h v] = freqz(1,a,FM,fs,'whole');

figure(3)
plot(w,db(abs(fftshift(h)).^2*sig2/N));

title('Modified Covariance PSD estimates of un-noised data of p=30', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



%% noised data

P = 5;
n = P;
y = data2;
r=zeros(n+1,1);
for i = 0 : n,
   r(i+1)=y(1:N-i)'*y(i+1:N)/N;
end
%r = xcorr(data1,'biased');
% form the y vector and Y matrix given in equation (3.4.14)
% with the first and the last n rows removed

Y1=toeplitz(y(n:N-1),y(n:-1:1).');

y1=[y(n+1:N)];
T = [y1,Y1];
TT=fliplr(T);
Y2 = TT(:,2:end);
y2 = TT(:,1);
% compute the AR coffecients
%a= -inv(Y1'*Y1)*Y1'*y1;

Y=[Y1;Y2];

yy = [y1;y2];

a = -Y\yy;


% compute the noise variance
sig2=norm(Y*a+yy)^2/(N-n)/2;

a=[1;a];

[h v] = freqz(1,a,FM,fs,'whole');

figure(4)
plot(w,db(abs(fftshift(h)).^2*sig2/N));

title('Modified Covariance PSD estimates of noised data of p=5', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;





P = 15;
n = P;
y = data2;
r=zeros(n+1,1);
for i = 0 : n,
   r(i+1)=y(1:N-i)'*y(i+1:N)/N;
end
%r = xcorr(data1,'biased');
% form the y vector and Y matrix given in equation (3.4.14)
% with the first and the last n rows removed

Y1=toeplitz(y(n:N-1),y(n:-1:1).');

y1=[y(n+1:N)];
T = [y1,Y1];
TT=fliplr(T);
Y2 = TT(:,2:end);
y2 = TT(:,1);
% compute the AR coffecients
%a= -inv(Y1'*Y1)*Y1'*y1;

Y=[Y1;Y2];

yy = [y1;y2];

a = -Y\yy;


% compute the noise variance
sig2=norm(Y*a+yy)^2/(N-n)/2;

a=[1;a];

[h v] = freqz(1,a,FM,fs,'whole');

figure(5)
plot(w,db(abs(fftshift(h)).^2*sig2/N));

title('Modified Covariance PSD estimates of un-noised data of p=15', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



P = 30;
n = P;
y = data2;
r=zeros(n+1,1);
for i = 0 : n,
   r(i+1)=y(1:N-i)'*y(i+1:N)/N;
end
%r = xcorr(data1,'biased');
% form the y vector and Y matrix given in equation (3.4.14)
% with the first and the last n rows removed

Y1=toeplitz(y(n:N-1),y(n:-1:1).');

y1=[y(n+1:N)];
T = [y1,Y1];
TT=fliplr(T);
Y2 = TT(:,2:end);
y2 = TT(:,1);
% compute the AR coffecients
%a= -inv(Y1'*Y1)*Y1'*y1;

Y=[Y1;Y2];

yy = [y1;y2];

a = -Y\yy;


% compute the noise variance
sig2=norm(Y*a+yy)^2/(N-n)/2;

a=[1;a];

[h v] = freqz(1,a,FM,fs,'whole');

figure(6)
plot(w,db(abs(fftshift(h)).^2*sig2/N));

title('Modified Covariance PSD estimates of noised data of p=30', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;