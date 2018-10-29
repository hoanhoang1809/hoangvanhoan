
% Tao giai dieu cho audio dau vao
fs = 44100; % tan so phat
t = 0 : 1/fs : 0.3; % thoi gian phat

f1 = 300; % tan so cua cac not nhac
f2 = 400;
f3 = 500;
f4 = 600;
f5 = 200;
A1 = .1;A2 = .2; A3 = .3; A4 = .4; A5 = .5;  % bien do

w = 0; % pha

x1 = A1 *sin( 2 * pi * f1 * t + w ); % cau hinh cac not nhac
x2 = A2 *sin( 2 * pi * f2 * t + w );
x3 = A3 *sin( 2 * pi * f3 * t + w );
x4 = A4 *sin( 2 * pi * f4 * t + w );
x5 = A5 *sin( 2 * pi * f5 * t + w );

% tao giai dieu
x6 = [x1 x2 x3 x5 x4 x1 x2 x3 x5 x4 x1 x2 x3 x5 x4 x1 x2 x3 x5 x4 x3 x5 x4 x5 x4 x1 x2 x3 x5 x4 x3 x5 x3 x5 x4 x3 x5];
audiowrite('melody.wav',x6,44100); % ghi file
[y,Fs] = audioread('orig_input.wav');
a1=y
a2=a1(1:length(x6));
y1=(x6+a2);
audiowrite('melody1.wav',y1,fs);
[y2,fs]=audioread('melody1.wav')
sound(y2,40000);

% Chuyen doi FFT
N = fs;
Y=fft(y);
subplot(2,1,1)
plot(abs(Y));

transform = fft(Y,N)/N;
magTransform = abs(transform);
f_axis = linspace(-fs/2,fs/2,N);
plot(f_axis,fftshift(magTransform));
xlabel('Frequency (Hz)');

% Tao spectogram cho tin hieu
subplot(2,1,2);
win = 128;
hop = win/2;            
nfft = win;
spectrogram(y1,win,hop,nfft,fs,'yaxis');
title('Spectogram(melody)');
