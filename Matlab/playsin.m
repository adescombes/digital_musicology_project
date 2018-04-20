function playsin(duration, gap, notes)


notes
[~,N] = size(notes);
nBits = 16;
Fs = 44100; %Hz
attack = 0.01; % s
release = 0.1;

for i=1:N
    
    [~,freq] = playmidinote(notes(i));
    
    wave = oscillator('Sinusoid', duration, freq);
    [~,S] = size(wave);
    enveloppe = zeros(S);
    
    for k=1:round(Fs*attack)
       
        
        
    end
    
    player = audioplayer(wave,Fs,nBits);
    playblocking(player)
    pause(gap)
    
end

end