function test(instrument)

dur = 1;
gap = 8;

    switch instrument
        
        case 'sin'
            playnotes(instrument,dur,gap,48,3)
            
        case 'piano'
            playnotes(instrument,dur,gap,48,3)

        case 'violin'
            playnotes(instrument,dur,gap,69,3)

        case 'trombone'
            playnotes(instrument,dur,gap,40,2)

        case 'saxophone'
            playnotes(instrument,dur,gap,58,3)

        case 'woodblocks'
            playnotes(instrument,dur,gap,48,3)

        case 'rototoms'
            playnotes(instrument,dur,gap,48,3)

        case 'takim'
            playnotes(instrument,dur,gap,48,3)
            
        case 'rhodes'
            playnotes(instrument,dur,gap,48,3)
            
        case 'wurli'
            playnotes(instrument,dur,gap,48,3)
            
        case 'guitar'
            playnotes(instrument,dur,gap,48,3)
            
        otherwise 

end