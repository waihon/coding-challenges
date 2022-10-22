# https://leetcode.com/problems/valid-palindrome/
# Given a string s, return true if it is a palindrome, or false otherwise.
# A phrase is a palindrome if, after converting all uppercase letters into
# lowercase letters and removing all non-alphanumeric characters, it reads
# the same forward and backward.

# Two pointers from outside:
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  s = s.gsub(/[^A-Za-z0-9]/, "").downcase 

  left = 0
  right = s.length - 1

  while left <= right
    if s[left] != s[right]
      return false
    end
    left += 1
    right -= 1
  end

  return true
end

if __FILE__ == $0
  begin
    test_cases = [
      [1, "aabaa", true],
      [2, "aabbaa", true],
      [3, "abc", false],
      [4, "a", true],
      [5, "", true],
      [6, " ", true],
      [7, "A man, a plan, a canal: Panama", true],
      [8, "race a car", false],
      [9, "race car", true ]]
    test_cases.each do |case_num, input, expected|
      unless (result = is_palindrome(input)) == expected
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