prefix="umbc"
#inputfile="/Volumes/mazen-1/word2vecData/text-datasets/umbc_data.txt"
#outputDir="/Volumes/mazen-1/word2vecData/trainingResults"
inputfile="./umbc_data.txt"
outputDir="."

../../word2vec-app/word2phrase -train $inputfile -output "$outputDir/$prefix-data-phrase.txt" -threshold 300 -debug 2

../../word2vec-app/word2phrase -train "$outputDir/$prefix-data-phrase.txt" -output "$outputDir/$prefix-data-phrase2.txt" -threshold 100 -debug 2

../../word2vec-app/word2vec -train "$outputDir/$prefix-data-phrase2.txt" -output "$outputDir/$prefix-vectors.bin" -cbow 1 -size 500 -window 10 -negative 10 -hs 0 -sample 1e-5 -threads 40 -binary 1 -iter 3 -min-count 10