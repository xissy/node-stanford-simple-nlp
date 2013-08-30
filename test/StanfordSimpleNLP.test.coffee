should = require 'should'

standfordSimpleNlpModule = require '../index'
StanfordSimpleNLP = standfordSimpleNlpModule.StanfordSimpleNLP


describe 'standfordSimpleNlpModule', ->
  
  describe 'StandordSimpleNLP', ->
    stanfordSimpleNLP = new StanfordSimpleNLP()

    describe '.loadPipeline(...)', ->
      it 'should be done', (done) ->
        stanfordSimpleNLP.loadPipeline (err) ->
          should.not.exist err
          done()

    describe '.loadPipelineSync(...)', ->
      it 'should be done', ->
        stanfordSimpleNLP.loadPipelineSync()

    describe '.process(...)', ->
      it 'should be done', (done) ->
        stanfordSimpleNLP.process 'Hello, Sydney!', (err, result) ->
          should.not.exist err
          should.exist result
          done()
