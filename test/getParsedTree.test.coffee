should = require 'should'

standfordSimpleNlpModule = require '../index'
getParsedTree = standfordSimpleNlpModule.getParsedTree


describe 'standfordSimpleNlpModule', ->
  treeString = '(ROOT (S (NP (PRP They)) (VP (VP (VBD were) (VP (VBN cost) (S (ADJP (JJ effective))))) (, ,) (VP (VBD held) (PRT (RP up)) (NP (NP (JJ great)) (, ,) (NP (DT no) (NNS leaks)) (, ,) (NP (DT no) (NNS dyes)) (CC or) (NP (JJ harsh) (NNS chemicals)))) (, ,) (CC and) (VP (VBD had) (NP (NP (DT a) (JJ simple) (NN design)) (PP (IN on) (NP (DT the) (NN outside)))))) (. .)))'

  describe 'getParsedTree(...)', ->
    it 'should be done', (done) ->
      parsedTree = getParsedTree treeString
      should.exist parsedTree
      should.exist parsedTree.type
      should.exist parsedTree.children
      parsedTree.children.should.have.length 1
      done()
