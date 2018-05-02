function playinstrument(duration, gap, notes, instrument)

system('taskkill /f /im vsthost.exe /fi "memusage gt 40"')

[~,N] = size(notes);
!"..\loopMIDI.exe" &
pause(1);

switch instrument
    case 'piano'
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\Salamander_Piano_-_64\Salamander Piano - 64.dll" &

    case 'violin'
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\VSCO2_Violin_-_64_V2\VSCO2 Violin - 64.dll" &
        
    case 'trombone'
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\VSCO2 Trombone - 64.instruments\VSCO2 Trombone - 64.dll" &
        
    case 'saxophone'
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\Iowa Alto Sax - 64.instruments\Iowa Alto Sax - 64.dll" &
        
    case 'woodblocks'
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\Clog Boxes.instruments\Clog Boxes.dll" &
        
    case 'rototoms'
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\royotoms\Royotoms.dll" &
        
    case 'takim'
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\Takim\Takim.dll" &
        
    case 'tunedperc'
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\SamsaraCycleAudio_PACE\Samsara_Pace.dll" &
        
    case 'gongs'
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\thai gongs\Thai Gongs.dll" &
        
    case 'rhodes'
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\MrRay73mk2\MrRay73mk2.dll" &
        
    case 'wurli'
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\Mrtramp2\MrTramp2.dll" &
        
    case 'guitar'
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\guitar\MS3.dll" &
        
    otherwise
        disp('No corresponding instrument: default piano')
        !"..\vsthostx64\vsthost.exe" /noload /nosave "..\Salamander_Piano_-_64\Salamander Piano - 64.dll" &
        
end
pause(10);

device = mididevice('Matlab'); % Requires loopmidi with port called "Matlab" as current midi port
channel = 1;
velocity = 127;
timestamp = 0;

for i=1:N
    
  msg = midimsg('Note',channel,notes(i),velocity,duration,timestamp);
  midisend(device,msg);
  pause(duration);
  pause(gap);
  
end

end