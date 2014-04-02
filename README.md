# node-stanford-simple-nlp

A simple node.js wrapper for Stanford CoreNLP.

#### What is Stanford CoreNLP?
Stanford CoreNLP provides a set of natural language analysis tools which can take raw English language text input and give the base forms of words, their parts of speech, whether they are names of companies, people, etc., normalize dates, times, and numeric quantities, and mark up the structure of sentences in terms of phrases and word dependencies, and indicate which noun phrases refer to the same entities. Stanford CoreNLP is an integrated framework, which make it very easy to apply a bunch of language analysis tools to a piece of text. Starting from plain text, you can run all the tools on it with just two lines of code. Its analyses provide the foundational building blocks for higher-level and domain-specific text understanding applications.

Stanford CoreNLP integrates all our NLP tools, including the part-of-speech (POS) tagger, the named entity recognizer (NER), the parser, and the coreference resolution system, and provides model files for analysis of English. The goal of this project is to enable people to quickly and painlessly get complete linguistic annotations of natural language texts. It is designed to be highly flexible and extensible. With a single option you can change which tools should be enabled and which should be disabled.

The Stanford CoreNLP code is written in Java and licensed under the GNU General Public License (v2 or later). Source is included. Note that this is the full GPL, which allows many free uses, but not its use in distributed proprietary software. The download is 214 MB and requires Java 1.6+.


## Installation

node-stanford-simple-nlp depends on [Standord CoreNLP](http://nlp.stanford.edu/software/corenlp.shtml) v1.3.2 or higher. And don't forget to [set proper environment variables](https://github.com/nearinfinity/node-java) like `JAVA_HOME` in your system.

    $ npm install stanford-simple-nlp

**Important!** You should download `stanford-corenlp-full-2013-11-12.zip` file and unzip to `jar/` folder. You can download the file from [here](http://nlp.stanford.edu/software/stanford-corenlp-full-2013-11-12.zip). This file couldn't be pushed to github & npm because of its too big size(about 211MB).


## Usage

### Initialize
```javascript
var StanfordSimpleNLP = require('stanford-simple-nlp').StanfordSimpleNLP;
```

#### with options
```javascript
var options = {
  annotators: ['tokenize', 'ssplit', 'pos', 'lemma', 'ner', 'parse' 'dcoref']
};

var stanfordSimpleNLP = new StanfordSimpleNLP(options, function(err) {
  stanfordSimpleNLP.process('This is so good.', function(err, result) {
    ...
  });
});
```

#### without options
```javascript
var stanfordSimpleNLP = new StanfordSimpleNLP( function(err) {
  stanfordSimpleNLP.process('This is so good.', function(err, result) {
    ...
  });
});
```

**Warning!** If you didn't initialize the class without callback function then you will meet `'Load a pipeline first.'` error. So you have to do it with callback function or call `loadPipeline(options, callback)` function seperately.


## License
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

This license also applies to the included Stanford CoreNLP files.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Author: Taeho Kim (xissysnd@gmail.com). Copyright 2013.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/xissy/node-stanford-simple-nlp/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

