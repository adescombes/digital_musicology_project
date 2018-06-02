# ML3 : final set up of the test, first participants    


## Test


The consists of two parts: first the participants are asked questions that address their musical learning, abilities and habits on a self-evaluation basis as well as general information that has been suggested or proven to be important in previous studies for the development of note recognition.
Each participant is interviewed by ourselves so as to be as consistent as possible among the whole set of tests. If needed, participants are given more precise indicators for giving self-evaluation ratings.
You can find the form [here.](https://docs.google.com/forms/d/1P1ym8JarJAZghTU-1nwLNatNFgqWBxnqtZ7UXKCrvuQ/prefill)


Finally the audio test is performed, as described during the following sections. Participants wear provided headphones that are plugged into the computer (Lenovo x220) internal sound card output, aside headphones that we wear to check the good proceed of the test. The volume of the audio is set with a feedback from the participants, so that they feel like they can hear the notes loud enough.

### Participants
The eligibility criteria for the participants is to have followed any musical study and/or to have learned how to play an instrument (by attending classes or in a self-educated way).
The participants will be picked upon musicians of UNIL/EPFL campus, during musical events such as rehearsals of the Big band, rehearsals of the soundpainting collective or rehearsals at the “Musical” rehearsal room - the local commission for promoting music on the campus. Most of these musicians have practiced their instrument for several years, most of them more than 10 years.

### Stimuli : audio test
The audio test consists of the participant hearing an audio stimuli and giving orally the names of the notes he thinks are the ones that are presented during the stimuli.
The audio stimuli consists of three series of twelve tones. The series are separated by some time that is used to start the next serie on the computer program. Each serie has a different timbre : the first one has a sin timbre, the second one a piano timbre and the third one’s timbre is adapted to each participant’s main instrument. The timbres that are used for the third serie are the following: wurlitzer (for the percussionists), alto saxophone (for woodwind instruments players), trombone (for the players of all brass instruments), guitar (for guitar and electric bass players), violin (for the players of any fretless string instruments).

Each tone within each serie has a duration of one second with a gap of eight seconds in between each successive tone. The participants usually give their answers during that gap, otherwise a blank is put in the answer sheet.

The sin tones are generated using a Matlab script with a sample rate of 44100 hz, with a linear 10ms attack and 10ms release. When looking at the resulting audio, we observe a short time after the attack (~10ms) during which the sin wave saturates the output of the audio card. Since this saturation is very transitory and minor (below 10% of the sin amplitude), we consider its influence on the first participants negligible. A coefficient of 0.9 to the produced wave fixed this issue for later tests.

The instruments tones are generated using virtual instrument plugins in VST format, hosted by the free software “VSThost”. Midi signals are generated by Matlab, piped through a dedicated port using “Loopmidi” free software are set as input to “VSThost” with negligible latency. The plugins that are used are the following:

- Piano: [http://www.vst4free.com/free_vst.php?plugin=Salamander_Piano&id=2564](http://www.vst4free.com/free_vst.php?plugin=Salamander_Piano&id=2564)
- Trombone: [http://www.vst4free.com/free_vst.php?plugin=VSCO2_Trombone&id=2556](http://www.vst4free.com/free_vst.php?plugin=VSCO2_Trombone&id=2556)
- Violin: [http://www.vst4free.com/free_vst.php?plugin=VSCO2_Violin&id=2540](http://www.vst4free.com/free_vst.php?plugin=VSCO2_Violin&id=2540)
- Wurlitzer: [http://www.genuinesoundware.com/?a=showproduct&b=40](http://www.genuinesoundware.com/?a=showproduct&b=40)
- Saxophone: [http://www.vst4free.com/free_vst.php?id=2513](http://www.vst4free.com/free_vst.php?id=2513)
- Guitar: [http://www.vst4free.com/free_vst.php?plugin=Strummer&id=2388](http://www.vst4free.com/free_vst.php?plugin=Strummer&id=2388)


All the plugins are used with their default settings, without any further processing on the signal before being sent to the audio card.

The tones are selected so that all the twelve pitch classes appear once and only once within the serie, in a random order, with at least one octave difference between two consecutive tones. The range in which the tones are selected is such that it covers a maximum of 3 octaves when possible, a minimum of 2 octaves and is centered on the middle of the usual playing range of the instrument.

Examples of series for sin waves and piano sounds are given as attachment in mp3 format.


## First results and interpretation

### Results processing and prior expectations

Given the actual series of tones that have been presented to the participants, the absolute difference in semitones between each tone and the given answer can be computed, disregarding the octave number of the presented tone. Therefore, all the differences lie between 0 - exact answer - and 6 - most distant possible answer. Since each difference is statistically symmetrically represented (one note for 0 and 6, two notes for 1 to 5), a set of answer based on luck would result in a average distance of 3 to the presented tones. From this observation, one can expect participants who have absolute pitch to present results with an average distance to the exact tones between 0 and 1. One can also expect participants who would have guessed the first presented tone thanks to luck or exposure to a known musical context before the experiment and who have relative pitch analysis to perform as almost as good.

### First results 

The mean absolute global error is 3,33
The mean global error (not absolute) is 0.296: there is a small bias, ie people perceive notes a bit higher than it is actually.

The results of the mean distance of the answer with respect to the presented notes is shown in the following table for the sin serie:

ID | Absolute mean error
---|---------------------------
1| 0.583
2| 3.629
3|4.400
4|3.235
5|3.912
6|3.917
7|4.419
8|4.833
9|3.278
10|4.333
11|3.409
12|0.139
13|3.449



The participants whith ID 1 and 12 are self-reported AP possessors, and have indeed much better results. 

So far, the number of participants is far from big enough to get relevant results for our study. Moreover, the few results contradict our first assumptions, that is that for instance percussion player would perform worse than brass players (see excel file attached and data_wrangling notebook). Few tests have been performed on percussion players, woodwind players and strings players. So far we observe that percussion players perform way better than other categories of players.

These first results confirm that our setup works and do not yields false positives. The next step for really interpreting the results would be to have way more results, so that we can conclude on the relation of the note recognition capacity with respect to the category of instrument played.

We have been able to process and to do simple statistics with our first results, using the sin serie results, however it is not relevant so far, because of the little amount of data collected.
We also observed better results for the piano and players’ instrument timbres but the quantification of this difference is also to be further investigated among each category of instrument.