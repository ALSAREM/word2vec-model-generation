#!/bin/sh
# This function will convert text to lowercase and remove special characters
#see https://www.gnu.org/software/sed/manual/html_node/Regular-Expressions.html
#see http://www.grymoire.com/Unix/Sed.html
#try on https://tio.run/#bash
# delete short words (-e 's/\b[a-z]\{1,3\}\b/ /g') is not working
normalize_text_hard() {
  awk '{print tolower($0);}' | sed -e 's/[^a-z ]//g' -e 's/\b[a-z]\{1,3\}\b/ /g' -e 's/ \+/ /g'
}


#outfile="/Volumes/mazen-1/word2vecData/text-datasets/umbc_data.txt"
outfile="./umbc_data.txt"

for i in `ls webbase_all`; do
  normalize_text_hard < webbase_all/$i >> $outfile
done