# https://leetcode.com/problems/valid-palindrome-ii/
# Given a string s, return true if the s can be palindrome
# after deleting at most one character from it.

# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
  s = s.gsub(/[^A-Za-z0-9]/, "").downcase 
  left = 0
  right = s.length - 1

  while left < right
    if s[left] != s[right]
      return sub_palindrome(s, left, right - 1) ||
             sub_palindrome(s, left + 1, right)
    else
      left += 1
      right -= 1
    end
  end

  return true
end

def sub_palindrome(s, left, right)
  while left < right
    if s[left] != s[right]
      return false
    else
      left += 1
      right -= 1
    end
  end

  return true
end

if __FILE__ == $0
  begin
    test_cases = [
      [1, "race a car", true],
      [2, "abccdba", true],
      [3, "abcdefdba", false],
      [4, "", true],
      [5, " ", true],
      [6, "a", true],
      [7, "ab", true],
      [8, "race car", true]
    ]
    test_cases.each do |case_num, input, expected|
      unless (result = valid_palindrome(input)) == expected
        puts "Test Case: #{case_num}, Input: #{input}, Actual Result: #{result}, Expected: #{expected}"
        raise RuntimeError
      end
    end
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end
