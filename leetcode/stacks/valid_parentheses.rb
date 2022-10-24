# https://leetcode.com/problems/valid-parentheses/
# Given a string s containing just the characters '(', ')', '{', '}',
# '[' and ']', determine if the input string is valid.

# @param {String} s
# @return {Boolean}
def is_valid(s)
  if s == "" || s.length < 2
    return false
  end
  
  parentheses_hash = Hash.new(false).merge({
    "(" => ")", "{" => "}", "[" => "]" })
  
  stack = []
  for i in 0..(s.length - 1)
    if parentheses_hash[s[i]]
      opening = s[i] 
      stack.push(opening)
    else
      closing = s[i]
      opening = stack.pop
      if parentheses_hash[opening] != closing
        return false
      end
    end
  end
 
  return stack.size.zero?
end
