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

if __FILE__ == $0
  begin
    raise RuntimeError unless length_of_longest_substring("abccabb") == 3
    raise RuntimeError unless length_of_longest_substring("cccccc") == 1
    raise RuntimeError unless length_of_longest_substring("") == 0
    raise RuntimeError unless length_of_longest_substring("abcbda") == 4
    raise RuntimeError unless length_of_longest_substring("abcabcbb") == 3
    raise RuntimeError unless length_of_longest_substring("bbbbb") == 1
    raise RuntimeError unless length_of_longest_substring("pwwkew") == 3
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end
