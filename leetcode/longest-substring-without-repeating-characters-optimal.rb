# https://leetcode.com/problems/longest-substring-without-repeating-characters
# Given a string s, find the length of the longest substring
# without repeating characters.

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  # Optimization
  return s.length if s.length <= 1

  longest = 0
  seen_chars = Hash.new(false)
  left = 0
  for right in 0..(s.length - 1)
    current_char = s[right]
    prev_seen_char_idx = seen_chars[current_char]
    if prev_seen_char_idx && prev_seen_char_idx >= left
      left = prev_seen_char_idx + 1
    end
    seen_chars[current_char] = right
    longest = [longest, right - left + 1].max
  end
  
  return longest 
end
