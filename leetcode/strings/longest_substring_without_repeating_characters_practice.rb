# https://leetcode.com/problems/longest-substring-without-repeating-characters
# Given a string s, find the length of the longest substring
# without repeating characters.

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  # Optimization
  return s.length if s.length <= 1

  left = 0
  right = 0
  seen_char_index_map = Hash.new
  longest = 0

  for right in 0..(s.length - 1)
    current_char = s[right]
    prev_seen_char_index = seen_char_index_map[current_char]
    # We shouldn't advance `left` if the found index is before `left`,
    # which indicates the corresponding character is outside of
    # current window.
    if prev_seen_char_index && prev_seen_char_index >= left
      left = prev_seen_char_index + 1 
    end

    seen_char_index_map[current_char] = right

    current_length = right - left + 1
    longest = [longest, current_length].max
  end

  return longest
end

if __FILE__ == $0
  begin
    test_cases = [[1, "abcbdaac", 4],
                  [2, "abccabb", 3],
                  [3, "cccccc", 1],
                  [4, "", 0],
                  [5, "abcbda", 4],
                  [6, "abcabcbb", 3],
                  [7, "bbbbb", 1],
                  [8, "pwwkew", 3]]
    test_cases.each do |case_num, input, expected|
      unless (result = length_of_longest_substring(input)) == expected 
        puts "Test Case: #{case_num}, Input: #{input}, Actual Eesult: #{result}, Expected: #{expected}"
        raise RuntimeError
      end
    end
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end
