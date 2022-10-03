# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  # s: "abc#d" => "abd"
  # t: "abzz##d" => "abc"
  p_s = s.length - 1
  p_t = t.length - 1
  
  while (p_s >= || p_t >= 0)
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
        backcount =
        2
        while backcount > 0
          p_t -= 1
          backcount -= 1
          if t[p_] == '#'
            backcount += 2
          end
      end
    else
      # Both string are at a postion in which their character
      # is sure to be in the final string. 
      if s[p_s] != t[p_t]
        return false
      else
        p_s -= 1
        p_t -= 1
    end
  end
  
  return true
end
    
