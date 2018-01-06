make
gzip -d data/1-billion.gz -f
time ./word2vec -train data/1-billion -output vectors.bin -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
./models vectors.bin
