%STEP1 A3
[y,Fs] = audioread("Speech.wav");
size(y);
%STEP3 A3
soundsc(y,Fs);
pause(5);
%STEP4 A3
audiowrite("Speech1.wav",y,Fs)
%STEP5 A3
N = length(y);
t = linspace(0, N/Fs, N);
plot(t, y);
hold on;
%STEP6 A3
y = resample(y,16000, Fs);
%Mean Filter 3-point average filter
d=(1/6)*[1 1 1];
c=1;
a = filter(d,c,y);
La = length(a);
b = linspace(0, N/Fs, La);
plot(b,a);
legend('Input Data','Mean Filtered Data');
title('Ideal Mean Filtering');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
%Write File
audiowrite("SpeechMean.wav",a,Fs);
[reada,Fsreada] = audioread("SpeechMean.wav");
soundsc (reada,Fsreada);
pause(5); 
figure;
%Slightly Distored filtering
d=(1/3)*[1 1 1];
c=1;
a2 = filter(d,c,y);
L2 = length(a);
b2 = linspace(0, N/Fs, L2);
plot(b, y, b2,a2);
legend('Input Data','Mean Filtered Data');
title('Slightly Distorted Mean Filtering');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
%Write File
audiowrite("SpeechMeanSD.wav",a2,Fs);
[reada,Fsreada] = audioread("SpeechMeanSD.wav");
soundsc (reada,Fsreada);
pause(5); 
figure;
%Extremly Distored filtering
d=(1/100)*[1 1 1];
c=1;
a2 = filter(d,c,y);
L2 = length(a);
b2 = linspace(0, N/Fs, L2);
plot(b, y, b2,a2);
legend('Input Data','Mean Filtered Data');
title('Extremly Distorted Mean Filtering');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
%Write File
audiowrite("SpeechMeanED.wav",a2,Fs);
[reada,Fsreada] = audioread("SpeechMeanED.wav");
soundsc (reada,Fsreada);
pause(5); 
figure;
%Weighted Average Filter
g = fspecial('gaussian',[1 15],10);
e = conv(y,g);
L3 = length(e);
d = linspace(0, N/Fs, L3);
plot(b, y, d,e);
legend('Input Data','Weighted Average Filtered Data');
title('Ideal Weighted Average Filter');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
%Write File
audiowrite("SpeechAverage.wav",e,Fs);
[readb,Fsreadb] = audioread("SpeechAverage.wav");
soundsc (readb,Fsreadb);
pause(5); 
figure;
%SD Weighted Average Filter
g = fspecial('gaussian',[1 7],10);
e2 = conv(y,g);
L3 = length(e2);
d = linspace(0, N/Fs, L3);
plot(b, y, d,e2);
legend('Input Data','Weighted Average Filtered Data');
title('Slightly Distorted Weighted Average Filter');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
%Write File
audiowrite("SpeechAverageSD.wav",e2,Fs);
[readb,Fsreadb] = audioread("SpeechAverageSD.wav");
soundsc (readb,Fsreadb);
pause(5); 
figure;
%ED Weighted Average Filter
g = fspecial('gaussian',[1 1000],10);
e2 = conv(y,g);
L3 = length(e2);
d = linspace(0, N/Fs, L3);
plot(b, y, d,e2);
legend('Input Data','Weighted Average Filtered Data');
title('Extremly Distorted Weighted Average Filter');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
%Write File
audiowrite("SpeechAverageED.wav",e2,Fs);
[readb,Fsreadb] = audioread("SpeechAverageED.wav");
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
title('Ideal Median Average Filter');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
%Write File
audiowrite("SpeechMedian.wav",z,Fs);
[readc,Fsreadc] = audioread("SpeechMedian.wav");
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
title('Slightly Distorted Median Average Filter');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
%Write File
audiowrite("SpeechMedian.wav",z1,Fs);
[readc,Fsreadc] = audioread("SpeechMedian.wav");
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
title('Extremely Distorted Median Average Filter');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
%Write File
audiowrite("SpeechMedian.wav",z2,Fs);
[readc,Fsreadc] = audioread("SpeechMedian.wav");
soundsc (readc,Fsreadc);
