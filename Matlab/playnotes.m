function playnotes(instrument, duration, gap, start, octaves)

% instrument

n = 12;
sequence = randperm(n);
shifts = zeros(1,n);

if (octaves>1)

    shifts(1) = randi([0 octaves-1],1,1);
    sequence(1) = sequence(1)+shifts(1)*12;

    if (octaves>2)
        for i=2:n

            shifts(i) = randi([0 octaves-1],1,1);
            while (abs(sequence(i)+shifts(i)*12-sequence(i-1))<11)
                shifts(i) = randi([0 octaves-1],1,1);
            end
            sequence(i) = sequence(i)+shifts(i)*12;
        end
    else % for 2 octaves span only
        for i=2:n

            shifts(i) = randi([0 octaves-1],1,1);
            while (abs(sequence(i)+shifts(i)*12-sequence(i-1))<6)
                shifts(i) = randi([0 octaves-1],1,1);
            end
            sequence(i) = sequence(i)+shifts(i)*12;
        end
    end
end

notes = start + sequence - 1;
names = strings(1,n);

notes = notes - 12;

for i=1:n
    
    [name,~] = playmidinote(notes(i));
    names(i) = name;
    
end

names

notes = notes + 12;

switch instrument
    case 'sin'
        playsin(duration, gap, notes);
        
    otherwise
        playinstrument(duration, gap, notes, instrument);
end

end