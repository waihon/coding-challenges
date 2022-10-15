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
  p_s = s.length - 1
  p_t = t.length - 1
  
  while (p_s >= 0 || p_t >= 0)
    if (s[p_s] == '#') || (t[p_t] == '#')
      if s[p_s] == '#'
        backcount = 2
        while backcount > 0
          p_s -= 1
          backcount -= 1
          if s[p_s] == '#'
            backcount += 2
          end
        end
      end
      
      if t[p_t] == '#'
        backcount = 2
        while backcount > 0
          p_t -= 1
          backcount -= 1
          if t[p_t] == '#'
            backcount += 2
          end
        end
      end
    else
      # Both string are at a postion in which their character
      # is sure to be in the final string.
      
      # Ruby's -1 points to the last character
      char_s = p_s < 0 ? "" : s[p_s]
      char_t = p_t < 0 ? "" : t[p_t]
      
      if char_s != char_t
        return false
      else
        p_s -= 1
        p_t -= 1
      end
    end
  end
  
  return true
end
