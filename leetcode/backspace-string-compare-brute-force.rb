# https://leetcode.com/problems/backspace-string-compare/
# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  s_temp = s.split("")
  t_temp = t.split("")
  s_array = []
  t_array = []
  
  s_temp.each do |c|
    if c == '#'
      s_array.pop
    else
      s_array.push(c)
    end 
  end
  
  t_temp.each do |c|
    if c == '#'
      t_array.pop
    else
      t_array.push(c)
    end
  end
    
  if s_array.length != t_array.length
    return false
  else
    s_str = s_array.join
    t_str = t_array.join
    if s_str == t_str
      return true
    else
      return false
    end
  end
end
