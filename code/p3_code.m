%Speech:
%STEP1 A3
[y,Fs] = audioread("Speech.wav");
size(y);
%STEP5 A3
N = length(y);
t = linspace(0, N/Fs, N);
plot(t, y);
hold on;
%STEP6 A3
y = resample(y,16000, Fs);
d=(1/2.23)*[1 1 1];
c=1;
y = filter(d,c,y);
La = length(y);
b = linspace(0, N/Fs, La);
plot(b,y);
legend('Input Data','Filtered Data');
title('Syllables Conting Filter');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
thL=0.5;
rise = 0;
for n=3:length(y)
    if y(n-1) - y(n-2) > 0 && y(n)-y(n-1) < 0 && y(n-1) >= thL
        rise = rise + 1;
    end
end
















%BPM:
% STEP1 A2
[y,Fs] = audioread("Drum.wav");
[m, n] = size(y);
Mono = (y(:,1)+y(:,2))/2;
size(Mono)
N = length(Mono);
t = linspace(0, N/Fs, N);
plot(t, Mono);
hold on;
% STEP6 A2
y = resample(Mono,16000, Fs);
g = fspecial('gaussian',[1 5],10);
e = conv(y,g);
lp1 = lowpass(e,0.09);
p2 = length(lp1);
b = linspace(0, N/Fs, p2);
plot(b,lp1);
legend('Input Data','Filtered Data');
title('BPM Conting Filter');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
thL=0.7;
rise1 = 0;
for n=3:length(y)
    if y(n-1) - y(n-2) > 0 && y(n)-y(n-1) < 0 && y(n-1) >= thL
        rise1 = rise1 + 1;
    end
end
timebeat = length(y);
newtime = ((timebeat/3)*60);
bpm = (((rise1/2)/timebeat)*newtime);









%Silence:
%STEP1 A1
[y,Fs] = audioread("Birds.wav");
[m, n] = size(y);
%STEP5 A1
N = length(y);
l = linspace(0, N/Fs, N);
plot(l, y);
hold on;
%STEP6 A1
y = resample(y,16000, Fs);
d=(1/10)*[1 1 1];
e=1;
a = filter(d,e,y);
La = length(a);
b = linspace(0, N/Fs, La);
plot(b,a);
legend('Input Signal','Filtered Signal');
title('Low-Pass Filter');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
figure;
z = [ ];
z2 = [ ];
for c = 1:La
        if y(c) < 0.05
            z(c) = 0.3;
            z2(c) = -0.3;
        else
            z(c) = 0;    
            z2(c) = 0;
        end
end
plot(b,y,b,z,'b',b,z2,'b');
legend('Filtered Signal','Areas Without Silence');
title('Silence Identifiying Filter');
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
