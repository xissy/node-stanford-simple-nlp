

class ParsedTree
  constructor: (@treeString) ->
    @parsedList = []
    @wordIndex = 1

    @parseRecursive @treeString, @parsedList
    
    @parsedTree = @parsedList[0]
    @parsedTree


  parseRecursive: (treeString, currentPosition) ->
    treeString = treeString[1..-2]
    splittedTokens = treeString.split(' ')
    firstToken = splittedTokens[0]
    treeString = splittedTokens[1..-1].join(' ')
   
    newList = []
    currentPosition.push
      type: firstToken
      children: newList
    currentPosition = newList
   
    bracketCount = 0
    currentTreeString = ''
    isBracket = false
   
    for char in treeString
      currentTreeString += char
   
      if char is '('
        bracketCount++
        isBracket = true
      else if char is ')'
        bracketCount--
   
        if bracketCount is 0
          currentTreeString = currentTreeString.replace(/^\s+|\s+$/g, '') # trim
   
          @parseRecursive currentTreeString, currentPosition
   
          currentTreeString = ''
   
    if not isBracket
      currentPosition.push
        type: firstToken
        word: splittedTokens[1]
        id: @wordIndex
   
      @wordIndex++


getParsedTree = (treeString) ->
  new ParsedTree(treeString).parsedTree



module.exports = getParsedTree
