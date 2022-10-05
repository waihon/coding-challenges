# https://leetcode.com/problems/valid-palindrome/

# Two pointers from center:
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  s = s.gsub(/[^A-Za-z0-9]/, "").downcase
  
  length = s.length
  return true if length <= 1
  
  left = length / 2
  right = left
  left -= 1 if length.even?
  
  while (left >= 0 && right < length)
    if s[left] != s[right]
      return false
    end
    
    left -= 1
    right += 1
  end
  
  return true 
end
