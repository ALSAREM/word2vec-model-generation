# Welcome to Word2Vec Model Generation

You can use the [Word2Vec proposed by Google](https://code.google.com/archive/p/word2vec/) to train models (vectors) to be used in any word2vec application.

In this project, we build codes for each sapcific datasource, like Wikipedia dump, or umbc_corpus. We don't include the data but we list here from where you can got them.

## Where to obtain the training data

The quality of the word vectors increases significantly with amount of the training data. For research purposes, you can consider using data sets that are available on-line:

- **enwik9**: First billion characters from wikipedia, [here](http://mattmahoney.net/dc/enwik9.zip).
- **Wikipedia**: Latest Wikipedia dump. Should be more than 3 billion words, [here](http://dumps.wikimedia.org/enwiki/latest/enwiki-latest-pages-articles.xml.bz2).
- (todo) WMT11 site: text data for several languages (duplicate sentences should be removed before training the models)
- **1-billion-word**: Dataset from "One Billion Word Language Modeling Benchmark" Almost 1B words, already pre-processed text, [here](http://www.statmt.org/lm-benchmark/1-billion-word-language-modeling-benchmark-r13output.tar.gz).
- **umbc**: UMBC webbase corpus Around 3 billion words, more info here. Needs further processing (mainly tokenization)t, [here](http://ebiquity.umbc.edu/redirect/to/resource/id/351/UMBC-webbase-corpus).


### Support or Contact

Having trouble with this project? Please contact me.
