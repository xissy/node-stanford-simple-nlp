# node-stanford-simple-nlp

A simple node.js wrapper for Stanford CoreNLP.

## Installation

node-stanford-simple-nlp depends on [Standord CoreNLP](http://nlp.stanford.edu/software/corenlp.shtml) v1.3.2 or higher. Don't forget to set JAVA variable referred to [node-java](https://github.com/nearinfinity/node-java).

    $ npm install stanford-simple-nlp

**Important!** You should download `stanford-corenlp-3.2.0-models.jar` file to `jar/` folder. You can download the file from [here](https://www.dropbox.com/s/z2tmwnde276wmbu/stanford-corenlp-3.2.0-models.jar). This file couldn't be pushed to github & npm because of its too big size(about 200MB).


## Usage

### Initialize
```javascript
var StanfordSimpleNLP = require('stanford-simple-nlp').StanfordSimpleNLP;
```

#### with options
```javascript
var options = {
  annotators = ['tokenize', 'ssplit', 'pos', 'lemma', 'ner', 'parse' 'dcoref'];
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
