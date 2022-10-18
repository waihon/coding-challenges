# https://leetcode.com/problems/backspace-string-compare/
# Given two strings s and t, return true if they are equal when both are
# typed into empty text editors. '#' means a backspace character.
# Note that after backspacing an empty text, the text will continue empty.

# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  # s: "abc#d" => "abd"
  # t: "abzz##d" => "abc"
      # Both string are at a postion in which their character
      # is sure to be in the final string.
      
      # Ruby's -1 points to the last character
  end
  
  return true
end

if __FILE__ == $0
  begin
    raise RuntimeError unless backspace_compare("ab#z", "az#z") == true
    raise RuntimeError unless backspace_compare("abcd#d", "acc#c") == false
    raise RuntimeError unless backspace_compare("x#y#z#", "a#") == true
    raise RuntimeError unless backspace_compare("a###b", "b") == true
    raise RuntimeError unless backspace_compare("Ab#z", "AB#Z") == false
    raise RuntimeError unless backspace_compare("ab#c", "ad#c") == true
    raise RuntimeError unless backspace_compare("ab##", "c#d#") == true
    raise RuntimeError unless backspace_compare("a#c", "b") == false
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end
