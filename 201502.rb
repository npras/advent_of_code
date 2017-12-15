require 'minitest/autorun'

# http://adventofcode.com/2015/day/2

def part1(i)
  l, w, h = i.split('x').map(&:to_i)
  f1 = l * w
  f2 = l * h
  f3 = h * w
  extra = [f1, f2, f3].min
  (2 * (f1 + f2 + f3)) + extra
end


def part2(i)
  l, w, h = i.split('x').map(&:to_i)
  smallest_perimeter = [l, w, h].min(2).reduce(0) do |peri_acc, side|
    peri_acc += (2 * side)
  end
  smallest_perimeter + (l * w * h)
end

####

area = File.foreach('data/201502.txt').reduce(0) do |area_acc, box|
  area_acc += part1(box.chomp!)
end
p area

area = File.foreach('data/201502.txt').reduce(0) do |area_acc, box|
  area_acc += part2(box.chomp!)
end
p area
####

describe 'AOC' do

  #it "part1" do
    #assert_equal 58, part1('2x3x4')
    #assert_equal 43, part1('1x1x10')
  #end

  #it "part2" do
    #assert_equal 34, part2('2x3x4')
    #assert_equal 14, part2('1x1x10')
  #end

end
