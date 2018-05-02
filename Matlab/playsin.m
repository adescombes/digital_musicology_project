function playsin(duration, gap, notes)

[~,N] = size(notes);
nBits = 16;
Fs = 44100; %Hz
attack = 0.01; % s
release = 0.01;

for i=1:N
    
    [~,freq] = playmidinote(notes(i));
    
    wave = oscillator('Sinusoid', duration, freq);
    wave = transpose(wave);
    [~,S] = size(wave);
    enveloppe = ones(1,S);       
    enveloppe(1:round(Fs*attack)) = linspace(0,1,round(Fs*attack));
    enveloppe(end-round(release*Fs)+1:end) = linspace(1,0,round(release*Fs));
    wave = enveloppe.*wave;
    
    player = audioplayer(wave,Fs,nBits);
    playblocking(player);
    pause(gap);
    
end

end