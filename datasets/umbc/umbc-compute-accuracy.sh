../compute-accuracy umbc_vectors.bin 400000 < ../questions-words.txt     # should get to almost 78% accuracy on 99.7% of questions
../compute-accuracy umbc_vectors.bin 1000000 < ../questions-phrases.txt  # about 78% accuracy with 77% coverage
