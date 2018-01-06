make
gzip -d 1-billion.gz -f
time ./word2vec -train 1-billion -output 1-billion-vectors.bin -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
