xmlFile="enwiki-pages-articles.xml"
prefix="enwiki-pages-articles"
iteration="4"
#outputDir="/Volumes/mazen-1/word2vecData/trainingResults"
outputDir="."

#WikiExtractor.py --processes 15 -o "$outputDir/$prefix-clean-files" --debug --no-templates -b 20G $xmlFile
#perl wikifil.pl $xmlFile >> "${prefix}-text.txt"

#../../word2vec-app/word2phrase -train "$outputDir/${prefix}.txt" -output "$outputDir/${prefix}-${iteration}-data-phrase.txt" -threshold 200 -debug 2
#../../word2vec-app/word2phrase -train "$outputDir/${prefix}-${iteration}-data-phrase.txt" -output "$outputDir/${prefix}-${iteration}-data-phrase2.txt" -threshold 100 -debug 2
../../word2vec-app/word2vec -train "$outputDir/${prefix}-data-phrase2.txt" -output "$outputDir/${prefix}-${iteration}-vectors.bin" -cbow 1 -size 200 -window 100 -negative 10 -hs 0 -sample 1e-5 -threads 50 -binary 1 -iter 3 -min-count 5


#../../word2vec-app/word2vec -train "$outputDir/${prefix}.txt" -output "$outputDir/${prefix}-vectors-v2.bin" -cbow 1 -size 50 -window 10 -negative 10 -hs 0 -sample 1e-5 -threads 100 -binary 1 -iter 1 -min-count 5
#../../word2vec-app/compute-accuracy "$outputDir/${prefix}-vectors-v2.bin" 400000 < ../../word2vec-app/questions-words.txt     # should get to almost 78% accuracy on 99.7% of questions
#../../word2vec-app/compute-accuracy "$outputDir/${prefix}-vectors-v2.bin" 1000000 < ../../word2vec-app/questions-phrases.txt  # about 78% accuracy with 77% coverage
