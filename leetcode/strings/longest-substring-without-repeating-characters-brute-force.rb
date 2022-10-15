# https://leetcode.com/problems/longest-substring-without-repeating-characters/
# Given a string s, find the length of the longest substring
# without repeating characters.

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  # Optimization
  return s.length if s.length <= 1

  longest = 0
  
  for left in 0..(s.length - 1)
    seen_chars = Hash.new(false)
    for right in left..(s.length - 1)
      current_char = s[right]
      if seen_chars[current_char] 
        break
      else
        seen_chars[current_char] = true
        longest = [longest, seen_chars.length].max
      end
    end
  end
  
  return longest 
end
