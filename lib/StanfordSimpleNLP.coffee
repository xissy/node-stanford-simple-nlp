java = require 'java'
xml2js = require 'xml2js'

java.options.push '-Xmx3g'

java.classpath.push "#{__dirname}/../jar/ejml-0.19-nogui.jar"
java.classpath.push "#{__dirname}/../jar/joda-time.jar"
java.classpath.push "#{__dirname}/../jar/jollyday.jar"
java.classpath.push "#{__dirname}/../jar/xom.jar"
java.classpath.push "#{__dirname}/../jar/stanford-corenlp-3.2.0-models.jar"
java.classpath.push "#{__dirname}/../jar/stanford-corenlp-3.2.0.jar"


getParsedTree = require './getParsedTree'


class StanfordSimpleNLP
  defaultOptions:
    annotators: [
      'tokenize'
      'ssplit'
      'pos'
      'lemma'
      'ner'
      'parse'
      'dcoref'
    ]


  constructor: (options, callback) ->
    if typeof options is 'function'
      callback = options
      options = null

    if callback? and typeof callback is 'function'
      @loadPipeline options, callback


  loadPipeline: (options, callback) ->
    if typeof options is 'function'
      callback = options
      options = @defaultOptions
    else if not options?
      options = @defaultOptions
    else
      if not options.annotators? or not Array.isArray(options.annotators)
        return callback new Error 'No annotators.'

    java.newInstance 'java.util.Properties', (err, properties) =>
      properties.setProperty 'annotators', options.annotators.join(', '), (err) =>
        return callback err  if err?

        java.newInstance 'edu.stanford.nlp.pipeline.StanfordCoreNLP', properties, (err, pipeline) =>
          return callback err  if err?
          
          @pipeline = pipeline
          callback null


  loadPipelineSync: (options) ->
    options = @defaultOptions  if not options?

    properties = java.newInstanceSync 'java.util.Properties'
    properties.setPropertySync 'annotators', options.annotators.join(', ')
    @pipeline = java.newInstanceSync 'edu.stanford.nlp.pipeline.StanfordCoreNLP', properties


  process: (text, callback) ->
    return callback new Error 'Load a pipeline first.'  if not @pipeline?

    @pipeline.process text, (err, annotation) =>
      return callback err  if err?

      java.newInstance 'java.io.StringWriter', (err, stringWriter) =>
        return callback err  if err?

        @pipeline.xmlPrint annotation, stringWriter, (err) =>
          return callback err  if err?
      
          stringWriter.toString (err, xmlString) =>
            return callback err  if err?

            xml2js.parseString xmlString,
              explicitRoot: false
              explicitArray: false
            ,
              (err, result) =>
                return callback err  if err?

                # add parsedTree.
                sentences = result?.document?.sentences?.sentence
                if typeof sentences is 'object' and Array.isArray sentences
                  for sentence in result?.document?.sentences?.sentence
                    sentence.parsedTree = getParsedTree sentence?.parse
                else
                  sentences.parsedTree = getParsedTree sentences?.parse

                callback null, result



module.exports = StanfordSimpleNLP
