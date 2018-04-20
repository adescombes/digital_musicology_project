% PLAYMIDINOTE Obtain information about a Midi note like its frequency and
% name in the equitempered scale assuming A4 is 440Hz.
%   [NOTENAME, FREQ] = PLAYMIDINOTE(MIDINUM) returns name of the note
%   correspondig to Midi note number MIDINUM and also returns its frequency
%   FREQ in Hz.
%
%   [NOTENAME, FREQ] = PLAYMIDINOTE(MIDINUM, 1) same as above, and
%   additionally plays the specified note for one second.
%
%   [NOTENAME, FREQ] = PLAYMIDINOTE(MIDINUM, 1, DUR) same as above, and
%   plays the specified note duration DUR seconds.
%
% Atul Ingle, Fri Jun 29, 2012

function [notename, freq] = playmidinote(midinum, varargin)

optlen = numel(varargin);
if optlen==0
    flag=0;
end
if optlen==1
    flag = varargin{1};
    dur = 1;
end
if optlen==2
    flag = varargin{1};
    dur = varargin{2};
end

if midinum>127 || midinum <0
    disp('Invalid MIDI note number');
    return;
end

midinumbers = ...
[0	1	2	3	4	5	6	7	8	9	10	11;...
12	13	14	15	16	17	18	19	20	21	22	23;...
24	25	26	27	28	29	30	31	32	33	34	35;...
36	37	38	39	40	41	42	43	44	45	46	47;...
48	49	50	51	52	53	54	55	56	57	58	59;...
60	61	62	63	64	65	66	67	68	69	70	71;...
72	73	74	75	76	77	78	79	80	81	82	83;...
84	85	86	87	88	89	90	91	92	93	94	95;...
96	97	98	99	100	101	102	103	104	105	106	107;...
108	109	110	111	112	113	114	115	116	117	118	119;...
120	121	122	123	124	125	126	127	999 999 999 999];

colheaders = ...
{ 'C' ,'C#','D','D#','E','F','F#','G','G#','A','A#','B' };

rowheaders = 0:10;

[i,j] = ind2sub(size(midinumbers), find(midinumbers==midinum));

notename = cell2mat([colheaders(j), num2str(rowheaders(i))]);
freq = 8.1757989156*2^(midinum/12);

if flag==1
    fs = 44100;
    t = 0:1/fs:dur;
    x = sin(2*pi*freq*t);% + 0.5*sin(2*pi*2*freq*t) + 0.2*sin(2*pi*0.5*freq*t);
    soundsc(x, fs);
end

end