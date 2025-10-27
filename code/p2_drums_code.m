% STEP1 A2
[y,Fs] = audioread("Drum.wav");
[m, n] = size(y);
% STEP2 A2
Mono = (y(:,1)+y(:,2))/2;
size(Mono)
% STEP3 A2
soundsc(Mono,Fs)
pause(5);
% STEP4 A2
audiowrite("Drum1.wav",Mono,Fs)
% STEP5 A2
N = length(Mono);
t = linspace(0, N/Fs, N);
plot(t, Mono);
hold on;
% STEP6 A2
y = resample(Mono,16000, Fs);
%Mean Filter 3-point average filter
d=(2/3)*[1 1 1];
c=1;
a = filter(d,c,y);
La = length(a);
b = linspace(0, N/Fs, La);
plot(b,a);
legend('Input Data','Mean Filtered Data');
title('Ideal Mean Filtering');
%Write File
audiowrite("DrumMean.wav",a,Fs);
[reada,Fsreada] = audioread("DrumMean.wav");
soundsc (reada,Fsreada);
pause(5); 
figure;
%Slightly Distored filtering
d=(1/2)*[1 1 1];
c=1;
a2 = filter(d,c,y);
L2 = length(a);
b2 = linspace(0, N/Fs, L2);
plot(b, y, b2,a2);
legend('Input Data','Mean Filtered Data');
title('Slightly Distorted Mean Filtering');
%Write File
audiowrite("DrumMeanSD.wav",a2,Fs);
[reada,Fsreada] = audioread("DrumMeanSD.wav");
soundsc (reada,Fsreada);
pause(5); 
figure;
%Extremly Distored filtering
d=(1/25)*[1 1 1];
c=1;
a2 = filter(d,c,y);
L2 = length(a);
b2 = linspace(0, N/Fs, L2);
plot(b, y, b2,a2);
legend('Input Data','Mean Filtered Data');
title('Extremly Distorted Mean Filtering');
%Write File
audiowrite("DrumMeanED.wav",a2,Fs);
[reada,Fsreada] = audioread("DrumMeanED.wav");
soundsc (reada,Fsreada);
pause(5); 
figure;
%Weighted Average Filter
g = fspecial('gaussian',[1 10],10);
e = conv(y,g);
L3 = length(e);
d = linspace(0, N/Fs, L3);
plot(b, y, d,e);
legend('Input Data','Weighted Average Filtered Data');
title('Ideal Weighted Average Filter');
%Write File
audiowrite("DrumAverage.wav",e,Fs);
[readb,Fsreadb] = audioread("DrumAverage.wav");
soundsc (readb,Fsreadb);
pause(5); 
figure;
%SD Weighted Average Filter
g = fspecial('gaussian',[1 2],10);
e2 = conv(y,g);
L3 = length(e2);
d = linspace(0, N/Fs, L3);
plot(b, y, d,e2);
legend('Input Data','Weighted Average Filtered Data');
title('Slightly Distorted Weighted Average Filter');
%Write File
audiowrite("DrumAverageSD.wav",e2,Fs);
[readb,Fsreadb] = audioread("DrumAverageSD.wav");
soundsc (readb,Fsreadb);
pause(5); 
figure;
%ED Weighted Average Filter
g = fspecial('gaussian',[1 25],10);
e2 = conv(y,g);
L3 = length(e2);
d = linspace(0, N/Fs, L3);
plot(b, y, d,e2);
legend('Input Data','Weighted Average Filtered Data');
title('Extremly Distorted Weighted Average Filter');
%Write File
audiowrite("DrumAverageED.wav",e2,Fs);
[readb,Fsreadb] = audioread("DrumAverageED.wav");
soundsc (readb,Fsreadb);
pause(5); 
figure;
%Median Average Filter
z = [];
z(1) = median ([0 0 y(1) y(2) y(3)]);
z(2) = median ([0 y(1) y(2) y(3) y(4)]);
for i = 3:length(y)-2
    z(i) = median([y(i-2) y(i-1) y(i) y(i+1) y(i+2)]);
end
Lz = length(z);
dz = linspace(0, N/Fs, Lz);
L10 = length(y);
dl = linspace(0, N/Fs, L10);
plot(dl,y,dz,z);
legend('Input Data','Median Average Filter');
%Write File
audiowrite("DrumMedian.wav",z,Fs);
[readc,Fsreadc] = audioread("DrumMedian.wav");
soundsc (readc,Fsreadc);
figure;
%Median Average Filter SD
z1 = [];
z1(1) = median ([0 y(1) y(2)]);
for i = 2:length(y)-1
    z1(i) = median([y(i-1) y(i) y(i+1)]);
end
Lz = length(z1);
dz = linspace(0, N/Fs, Lz);
L10 = length(y);
dl = linspace(0, N/Fs, L10);
plot(dl,y,dz,z1);
legend('Input Data','Slight Distortion Median Average Filter');
%Write File
audiowrite("DrumMedian.wav",z1,Fs);
[readc,Fsreadc] = audioread("DrumMedian.wav");
soundsc (readc,Fsreadc);
figure;
%Median Average Filter ED
z2 = [];
z2(1) = median ([0 0 0 y(1) y(2) y(3) y(4)]);
z2(2) = median ([0 0 y(1) y(2) y(3) y(4) y(5)]);
z2(3) = median ([0 y(1) y(2) y(3) y(4) y(5) y(6)]);
for i = 4:length(y)-3
    z2(i) = median([y(i-3) y(i-2) y(i-1) y(i) y(i+1) y(i+2) y(i+3)]);
end
Lz = length(z2);
dz = linspace(0, N/Fs, Lz);
L10 = length(y);
dl = linspace(0, N/Fs, L10);
plot(dl,y,dz,z2);
legend('Input Data','Extreme Distortion Median Average Filter');
%Write File
audiowrite("DrumMedian.wav",z2,Fs);
[readc,Fsreadc] = audioread("DrumMedian.wav");
soundsc (readc,Fsreadc);
 
