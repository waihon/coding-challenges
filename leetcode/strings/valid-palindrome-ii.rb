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

if __FILE__ == $0
  begin
    raise RuntimeError unless valid_palindrome("race a car") == true
    raise RuntimeError unless valid_palindrome("abccdba") == true
    raise RuntimeError unless valid_palindrome("abcdefdba") == false 
    raise RuntimeError unless valid_palindrome("") == true 
    raise RuntimeError unless valid_palindrome(" ") == true 
    raise RuntimeError unless valid_palindrome("a") == true 
    raise RuntimeError unless valid_palindrome("ab") == true 
    raise RuntimeError unless valid_palindrome("race car") == true 
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end
