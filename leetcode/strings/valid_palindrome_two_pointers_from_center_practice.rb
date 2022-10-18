# https://leetcode.com/problems/valid-palindrome/
# Given a string s, return true if it is a palindrome, or false otherwise.
# A phrase is a palindrome if, after converting all uppercase letters into
# lowercase letters and removing all non-alphanumeric characters, it reads
# the same forward and backward.

# Two pointers from center:
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
end

if __FILE__ == $0
  begin
    raise RuntimeError unless is_palindrome("aabaa") == true
    raise RuntimeError unless is_palindrome("aabbaa") == true
    raise RuntimeError unless is_palindrome("abc") == false
    raise RuntimeError unless is_palindrome("a") == true 
    raise RuntimeError unless is_palindrome("") == true
    raise RuntimeError unless is_palindrome(" ") == true
    raise RuntimeError unless is_palindrome("A man, a plan, a canal: Panama") == true
    raise RuntimeError unless is_palindrome("race a car") == false
    raise RuntimeError unless is_palindrome("race car") == true 
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end