# audio-signal-filtering
![silence_identifying_filter](https://github.com/Simha-Kalimipalli/audio-signal-filtering/blob/main/images/silence_identifying_filter.png "silence_identifying_filter")

In this project, we used various techniques to create low-pass filters to reduce noise in three sound clips, a) birds chirping b) drums being played c) a human voice. Once we cleaned the audio, our main goals were to 1) Find the silent regions in the Bird chriping audio, 2) Find the number of beats per minute in the Drum sample, 3) Find the number of syllables in the human voice audio.  We used various Matlab sound processing functions to aide our work.

# Files
  *  **code** : Contains our Matlab code files.
      *  **p1_code.m** : Code for part 1 (Upsampling/Downsampling to 16KHz)
      *  **p2_birds_code.m** : Code for part 2 (Silent region analysis).
      *  **p2_drums_code.m** : Code for part 2 (Drum beat analysis).
      *  **p2_speech_code.m** : Code for part 2 (Syllable analysis).
      *  **p3_code.m** : Code for part 3 (Applying parts 1 & 2 to solve real-world problems).
         
  *   **Final Project Report** : 35 page report summarizing our approach, filter design and findings.
  *   **images** : Sample images for illustration.

# Images 
### Graph of 3 main audio signals
![3_sounds](https://github.com/Simha-Kalimipalli/audio-signal-filtering/blob/main/images/3_sounds.png "3_sounds")

## Upsampling/Downsampling signal process
![part1_diagram](https://github.com/Simha-Kalimipalli/audio-signal-filtering/blob/main/images/part1_diagram.png "part1_diagram")

### Ideal Low-pass filter for Bird Silent region analysis
![ideal_bird_filter](https://github.com/Simha-Kalimipalli/audio-signal-filtering/blob/main/images/ideal_bird_filter.png "ideal_bird_filter")

### Ideal Low-pass filter for Syllable Counting analysis
![ideal_speech_filter](https://github.com/Simha-Kalimipalli/audio-signal-filtering/blob/main/images/ideal_speech_filter.png "ideal_speech_filter")


