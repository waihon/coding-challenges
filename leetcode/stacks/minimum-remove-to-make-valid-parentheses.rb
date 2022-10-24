# https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/
# Given a string s of '(' , ')' and lowercase English characters.
# Your task is to remove the minimum number of parentheses ( '(' or ')',
# in any positions ) so that the resulting parentheses string is valid
# and return any valid string.

# @param {String} s
# @return {String}
def min_remove_to_make_valid(s)
  res = s.split("")
  stack = []
  
  for i in 0..(res.length - 1)
    if res[i] == "("
      stack.push(i)
    elsif res[i] == ")"
      if stack.length > 0
        stack.pop
      else
        res[i] = "" # mark this for deletion later on
      end
    end
  end
  
  for idx in 0..(stack.length - 1)
    res[idx] = "" # mark this for deletion later on
  end
  
  res.join("") # including deletion of "" marked earlier
end
