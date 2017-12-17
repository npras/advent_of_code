require 'minitest/autorun'


#http://adventofcode.com/2015/day/5


def part1(i)
  three_vowels = ->(str) do
    vowels_count = 0
    vowels = %w(a e i o u)
    str.each_char do |char|
      if vowels.include?(char)
        vowels_count += 1
        return true if vowels_count == 3
      end
    end
    false
  end
  double_letters = ->(str) { /(.)\1/.match?(str) }
  contains_not = ->(str) { !/ab|cd|pq|xy/.match?(str) }
  three_vowels[i] && double_letters[i] && contains_not[i]
end


def part2(i)
  non_overlapping_doubles = ->(str) { /(..).*\1/.match?(str) }
  single_char_between = ->(str) { /(.).\1/.match?(str) }
  non_overlapping_doubles[i] && single_char_between[i]
end


####

nice_count = 0
File.foreach('data/201505.txt') do |string|
  nice_count += 1 if part2(string.chomp!)
end
p nice_count

####


class TestThis < Minitest::Test

  #def test_part1
    #assert_equal true, part1('ugknbfddgicrmopn')
    #assert_equal true, part1('aaa')
    #assert_equal false, part1('jchzalrnumimnmhp')
    #assert_equal false, part1('haegwjzuvuyypxyu')
    #assert_equal false, part1('dvszwmarrgswjxmb')
  #end

  def test_part2
    assert_equal true, part2('qjhvhtzxzqqjkmpb')
    assert_equal true, part2('xxyxx')
    assert_equal false, part2('uurcxstgmygtbstg')
    assert_equal false, part2('ieodomkazucvgmuy')
  end

end
