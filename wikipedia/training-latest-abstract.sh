xmlFile="enwiki-latest-abstract.xml"
prefix="enwiki-latest-abstract"

# This function will convert text to lowercase and remove special characters
normalize_text() {
  awk '{print tolower($0);}' | sed -e "s/’/'/g" -e "s/′/'/g" -e "s/''/ /g" -e "s/'/ ' /g" -e "s/“/\"/g" -e "s/”/\"/g" \
  -e 's/"/ " /g' -e 's/\./ \. /g' -e 's/<br \/>/ /g' -e 's/, / , /g' -e 's/(/ ( /g' -e 's/)/ ) /g' -e 's/\!/ \! /g' \
  -e 's/\?/ \? /g' -e 's/\;/ /g' -e 's/\:/ /g' -e 's/-/ - /g' -e 's/=/ /g' -e 's/=/ /g' -e 's/*/ /g' -e 's/|/ /g' \
  -e 's/«/ /g' | tr 0-9 " "
}

perl wikifil.pl $xmlFile >> "${prefix}-text.txt"

normalize_text "${prefix}-text.txt" >> "${prefix}-data.txt"

../word2phrase -train "${prefix}-data.txt" -output "${prefix}-data-phrase.txt" -threshold 200 -debug 2
../word2phrase -train d"${prefix}-data-phrase.txt" -output "${prefix}-data-phrase2.txt" -threshold 100 -debug 2
../word2vec -train "${prefix}-data-phrase2.txt" -output "${prefix}-vectors.bin" -cbow 1 -size 500 -window 10 -negative 10 -hs 0 -sample 1e-5 -threads 40 -binary 1 -iter 3 -min-count 10
../compute-accuracy "${prefix}-vectors.bin" 400000 < ../questions-words.txt     # should get to almost 78% accuracy on 99.7% of questions
../compute-accuracy "${prefix}-vectors.bin" 1000000 < ../questions-phrases.txt  # about 78% accuracy with 77% coverage
