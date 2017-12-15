require 'minitest/autorun'


#An opening parenthesis, (, means he should go up one floor,
#and a closing parenthesis, ), means he should go down one floor.

def part1(i)
  floor = 0
  i.each_char do |char|
    case char
      when '(' then floor += 1
      when ')' then floor -= 1
    end
  end
  floor
end


def part2(i)
  floor = 0
  i.each_char.with_index do |char, idx|
    case char
    when '('
      floor += 1
    when ')'
      floor -= 1
    end
    return idx + 1 if floor == -1
  end
  -1
end


describe 'AOC' do

  it "part2" do
    assert_equal 1, part2(')')
    assert_equal 5, part2('()())')
    assert_equal 1795, part2(File.read('data/201501.txt').chomp!)
  end

  #it "part1" do
    #assert_equal 0, part1('(())')
    #assert_equal 0, part1('()()')
    #assert_equal 3, part1('(((')
    #assert_equal 3, part1('(()(()(')
    #assert_equal 3, part1('))(((((')
    #assert_equal -1, part1('())')
    #assert_equal -1, part1('))(')
    #assert_equal -3, part1(')))')
    #assert_equal -3, part1(')())())')
    #assert_equal 74, part1(File.read('data/201501.txt').chomp!)
  #end

end
