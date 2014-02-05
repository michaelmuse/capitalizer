##If you want to debug, uncomment the line below
# require 'pry'

#############################################################################################
##This method finds where the current delimiter starts. Used by the createCapString method
def findCapStartDelimiter(string)
  string.index('$^')
end

##This method finds where the current delimiter ends. Used by the createCapString method
def findCapFinishDelimiter(string)
  string.index('^$')
end


#############################################################################################
##This method capitalizes whatever is within the current iteration of delimiters
def setCapArray(string, start, finish)
  string.slice(start, finish).upcase!
end


#############################################################################################
##This augments the string by joining the rest of the string with what is in the 
##delimiters, once that part has been capitalized. Used by the capitalizer method
def createCapString(string)
  newstring = []
  start = findCapStartDelimiter(string)
  finish = findCapFinishDelimiter(string)
  newstring << string.slice(0, start)
  newstring << setCapArray(string, (start +2), (finish -2)) #The twos here account for the delimiter length
  newstring << string.slice(finish+2, (string.length - finish)) #Again accounting for the delimiter
  return newstring.join
end


#############################################################################################
##This is the main process. Pass in a string with the delimiters and itll capitalize it for you
def capitalizer(string)
  while string.include?('$^') && string.include?('^$')
      string = createCapString(string)
  end
  if string.include?('^$')
    string.sub('^$', '')
  else
    return string
  end
end

#############################################################################################
##Here you can see the method working
myStringTest = '$^capitalize this^$ for me please. $^also this^$'
myAnswer = capitalizer(myStringTest)
puts myAnswer
