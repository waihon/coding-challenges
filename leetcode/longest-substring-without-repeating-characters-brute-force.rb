# https://leetcode.com/problems/longest-substring-without-repeating-characters/

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  # Optimization
  return s.length if s.length <= 1

  max_length = 0
  
  for p1 in 0..(s.length - 1)
    unique_chars = Hash.new(false)
    p2 = p1
    while p2 <= (s.length - 1)
      if unique_chars[s[p2]] 
        break
      else
        unique_chars[s[p2]] = true
        max_length = [max_length, unique_chars.length].max
        p2 += 1
      end
    end
  end
  
  return max_length
end
