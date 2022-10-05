# https://leetcode.com/problems/valid-palindrome/

# Two pointers from outside:
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  s = s.gsub(/[^A-Za-z0-9]/, "").downcase
  
  return true if s.length <= 1
  
  left = 0
  right = s.length - 1
  
  while (left < right)
    if s[left] != s[right]
      return false
    end
    
    left += 1
    right -= 1
  end
  
  return true
end
