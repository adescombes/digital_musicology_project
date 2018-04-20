function playnotes(duration, gap, start, octaves)

n = 12;
sequence = randperm(n);
% sequence = 1 + randperm(n);

shifts = zeros(1,n);

if (octaves>1)

    shifts(1) = randi([0 octaves-1],1,1);

    for i=2:n

        shifts(i) = randi([0 octaves-1],1,1);
        while (abs(sequence(i)+shifts(i)*12-sequence(i-1))<11)
            shifts(i) = randi([0 octaves-1],1,1);
        end
        sequence(i) = sequence(i)+shifts(i)*12;

    end
end

notes = start + sequence - 1;

% mod(sequence,12) + 1
% sequence

prompt = 'What experiment? 1 = sin | 2 = piano | 3 = ... ';
exp = input(prompt)

switch exp
    case 1
        playsin(duration, gap, notes);
        
    case 2
        playpiano(duration, gap, notes);
        
    otherwise
        disp('No corresponding experiment')
end

end