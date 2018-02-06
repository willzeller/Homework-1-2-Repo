module FunWithStrings
  def palindrome?
    s = self.downcase.gsub(/[^a-z]/, '')
    length = s.length
    first = s[0..((length - 1) / 2)]
    last = s[(length / 2)..(length - 1)].reverse
    return first == last
  end
  def count_words
    s = self.downcase
    wordCounts = Hash.new(0)
    s.scan(/\w+/){ |word| 
      wordCounts[word] = wordCounts[word] + 1 
    }
    
    return wordCounts
  end
  def anagram_groups
    s = self
    if s.length == 0
      return []
    end
    arr = [[]]
    
    s.scan(/\w+/).each { |word|
      if arr[0].size == 0
        arr[0][0] = word
        next
      end
      newGroupFlag = true
      (0..arr.length - 1).each{ |i|
        str = arr[i][0]
        if str.length == word.length
          str.split("").each { |char|
            if word.index(char) == nil
              newGroupFlag = true
              break
            else
              newGroupFlag = false
            end
          }  
          if !newGroupFlag
            arr[i].push(word)
            break
          end
        end
        if !newGroupFlag
          break
        end
      }
      if newGroupFlag
        arr.push([word])
      end
    }
    
    return arr
  end
  
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
