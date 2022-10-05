# https://leetcode.com/problems/valid-palindrome-ii/
# Given a string s, return true if the s can be palindrome
# after deleting at most one character from it.

# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
  s = s.gsub(/[^A-Za-z0-9]/, "").downcase
  
  return true if s.length <= 1
  
  left = 0; right = s.length - 1
  
  while left < right
    if s[left] != s[right]
      return sub_palindrome(s, left, right -1) || sub_palindrome(s, left + 1, right)
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
