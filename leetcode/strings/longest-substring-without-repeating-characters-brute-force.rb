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
