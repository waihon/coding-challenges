# https://leetcode.com/problems/backspace-string-compare/
# Given two strings s and t, return true if they are equal when both are
# typed into empty text editors. '#' means a backspace character.
# Note that after backspacing an empty text, the text will continue empty.
  
# @param {String} str
# @return {String}
def output_string(str)
  str_array = str.split("")
  output_array = []
  
  str_array.each do |char|
    if char == '#'
      output_array.pop
    else
      output_array.push(char)
    end
  end
  
  return output_array.join
end

# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  s_output = output_string(s)
  t_output = output_string(t)
  
  if s_output.length != t_output.length
    return false
  else
    if s_output == t_output
      return true
    else
      return false
    end
  end
end
