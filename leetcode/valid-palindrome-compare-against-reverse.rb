# https://leetcode.com/problems/valid-palindrome/

# Compare against reverse:
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  s = s.gsub(/[^A-Za-z0-9]/, "").downcase
  rev = s.reverse
  
  return s == rev
end
