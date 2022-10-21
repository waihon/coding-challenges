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
  ps = s.length - 1
  pt = t.length - 1

  while ps >= 0 || pt >= 0
    if s[ps] == "#" || t[pt] == "#"
      if s[ps] == "#"
        backcount = 2
        while backcount > 0
          backcount -= 1
          ps -= 1
          backcount += 2 if s[ps] == "#"
        end
      end
      if t[pt] == "#" 
        backcount = 2
        while backcount > 0
          backcount -= 1
          pt -= 1
          backcount += 2 if s[pt] == "#"
        end
      end
    else
      # Both string are at a postion in which their character
      # is sure to be in the final string.
      if s[ps] != t[pt]
        return false
      else
        ps -= 1
        pt -= 1
      end
    end
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
