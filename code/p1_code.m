%STEP1 A1
[y,Fs] = audioread("Birds.wav");
[m, n] = size(y);
%STEP3 A1
soundsc(y,Fs);
pause(10); 
%STEP4 A1
audiowrite("Birds1.wav",y,Fs);
%STEP5 A1
N = length(y);
l = linspace(0, N/Fs, N);
plot(l, y);
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
title('Bird Sound');

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
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
title('Drum Sound');

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
xlabel('time (t –>)') ;
ylabel('Frequency Hz') ;
title(’Speech Sound');
