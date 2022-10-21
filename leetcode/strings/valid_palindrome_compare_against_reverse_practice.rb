# https://leetcode.com/problems/valid-palindrome/
# Given a string s, return true if it is a palindrome, or false otherwise.
# A phrase is a palindrome if, after converting all uppercase letters into
# lowercase letters and removing all non-alphanumeric characters, it reads
# the same forward and backward.

# Compare against reverse:
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  return nil if s.nil?
  
  # s.gsub!(/[^A-Za-z0-9]/, "")&.downcase!
  s = s.gsub(/[^A-Za-z0-9]/, "")&.downcase
  rev = []
  sa = s.split("")
  sa.reverse_each { |c| rev.push(c) }
  
  for i in 0..(sa.length - 1)
    if sa[i] != rev[i]
      return false
    end
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
