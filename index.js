var CoffeeScript = require('coffee-script');

if (CoffeeScript.register) {
  CoffeeScript.register();
}

module.exports = require('./lib/index');
