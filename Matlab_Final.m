p1 = xlsread('samples.csv');

s1=p1(:,1);
pp1=p1(:,2);

fs=250;

timesamples=0:length(p1)-1;
y1=timesamples*(1/fs);




fsh = fs/2; %half the sampling rate
%% filtering

[b,a] = butter(2, 70/fsh); %70/fsh is the cutoff frequency
% Butterworth filter frequency response

M = 128;
ecg1=filter(b, a, pp1);
plot(y1,ecg1); ylabel('ECG (mV)'); xlabel('Time(s)'); title('ECG waveform of subject 1 after low-pass filter');

wo = 60/(250/2);  
bw = wo/35;
[b,a] = iirnotch(wo,bw);

ecg1x = filter(b,a ,ecg1);
figure()

plot(y1,ecg1x);
title('ECG Time Response with Notch Filter @ 60 Hz')
xlabel('Time in seconds');
ylabel('ECG');

slen=length(ecg1x); 

x1 = fft(ecg1x);
ff= fix(slen/2) + 1;
maxft = max(abs(x1));
f1 = (1:ff)*fs/slen; % frequency axis up to fs/2.
ecgspec = 20*log10(abs(x1)/maxft);
figure()
plot(f1, ecgspec(1:ff));
xlabel('Frequency in Hz');
ylabel('Log Magnitude Spectrum (dB)');
title('Power Spectrum of the ECG with Notch Filter @ 60Hz and low pass filter with cutoff @ 70Hz');
axis tight;


%% detecting peaks


[Peaks1,Location1] = findpeaks(ecg1,'MinPeakHeight',0.85); %detect R 
PeakTime1 = s1(Location1);


Location1 = Location1/250;
for i = 1:length(PeakTime1)-1
    n=0;
    n =  n + 1./(Location1(i+1)-Location1(i)).*60;
end

bpm2 = n;

[lmn,npr] = islocalmin(ecg1, 'MinProminence',0.1);      % Detect: Q & S
lnix = find(lmn);
prqs = npr(lnix);

figure()
plot(y1,ecg1); ylabel('ECG (mV)'); xlabel('Time(s)'); title('ECG waveform of subject 1 after low-pass filter');
hold on 
plot(y1(lnix), ecg1(lnix), 'gv')
hold on 
scatter(PeakTime1,Peaks1);




%% heart rate variability


timeBetweenPeaks=diff(Location1);
figure()
plot(PeakTime1(1:55),timeBetweenPeaks); ylabel('ECG (mV)'); xlabel('Time(s)'); title('ECG waveform of subject 1 after low-pass filter');


%% if statements

if (timeBetweenPeaks > 1.0 )
    disp('RR interval is too large');
    
end

if (bpm2 < 60) 
    disp('Subject has bradychardia');

if (bpm2 > 100) 
    disp('Subject has tachychardia');

end

    


