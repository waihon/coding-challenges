# @param {Integer} num
# @return {String}
def int_to_roman(num)
  keys_values = {
       4 => "IV",   9 => "IX",
      40 => "XL",  90 => "XC",
     400 => "CD", 900 => "CM",
       1 => "I",    5 => "V",
      10 => "X",   50 => "L",
     100 => "C",  500 => "D",
    1000 => "M"
  }

  integers = to_array(num) # [3000, 700, 90, 3]
  integers = expand(integers)
  romans = integers.map { |integer| keys_values[integer] }
  # [1000, 1000, 1000, 500, 100, 100, 90, 1, 1, 1]
  romans.join # MMMDCCXCIII
end

def to_array(num)
  # 1 <= num <= 3999
  num.to_s.split("").reverse.map(&:to_i).
    each_with_index.map { |num, i | num * (10 ** i) }.reverse
end

def expand(integers)
  expanded_integers = []
  integers.each do |integer|
    # 1 <= integer <= 3999
    [1000, 100, 10, 1].each do |divisor|
      if integer % divisor == 0
        multiplier = integer / divisor 
        if [1, 4, 5, 9].include?(multiplier)
          expanded_integers << (multiplier * divisor)
        elsif [2, 3].include?(multiplier)
          multiplier.times { expanded_integers << divisor}
        elsif [6, 7, 8].include?(multiplier)
          expanded_integers << (5 * divisor)
          (multiplier - 5).times { expanded_integers << divisor }
        end
      end
    end
  end
  expanded_integers
end
