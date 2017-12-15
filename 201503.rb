require 'minitest/autorun'
require 'set'

# http://adventofcode.com/2015/day/3

#He begins by delivering a present to the house at his starting location, and then an elf at the North Pole calls him via radio and tells him where to move next. Moves are always exactly one house to the north (^), south (v), east (>), or west (<). After each move, he delivers another present to the house at his new location.

#However, the elf back at the north pole has had a little too much eggnog, and so his directions are a little off, and Santa ends up visiting some houses more than once. How many houses receive at least one present?

def part1(i)
  houses = Set.new [[0, 0]]
  santa_position = [0, 0]
  i.each_char do |char|
    next unless %w(< > ^ v).include?(char)
    santa_position = case char
                     when ?<
                       [santa_position[0] - 1, santa_position[1]]
                     when ?>
                       [santa_position[0] + 1, santa_position[1]]
                     when ?^
                       [santa_position[0], santa_position[1] + 1]
                     when ?v
                       [santa_position[0], santa_position[1] - 1]
                     end
    houses.add santa_position
  end
  houses.size
end


def part2(i)
  houses = Set.new [[0, 0]]
  santa1_position = [0, 0]
  santa2_position = [0, 0]
  i.each_char.with_index do |char, idx|
    next unless %w(< > ^ v).include?(char)
    if (idx + 1) % 2 == 0
      santa2_position = case char
                        when ?<
                          [santa2_position[0] - 1, santa2_position[1]]
                        when ?>
                          [santa2_position[0] + 1, santa2_position[1]]
                        when ?^
                          [santa2_position[0], santa2_position[1] + 1]
                        when ?v
                          [santa2_position[0], santa2_position[1] - 1]
                        end
      houses.add santa2_position
    else
      santa1_position = case char
                        when ?<
                          [santa1_position[0] - 1, santa1_position[1]]
                        when ?>
                          [santa1_position[0] + 1, santa1_position[1]]
                        when ?^
                          [santa1_position[0], santa1_position[1] + 1]
                        when ?v
                          [santa1_position[0], santa1_position[1] - 1]
                        end
      houses.add santa1_position
    end
  end
  houses.size
end

####
#p part1(File.read('data/201503.txt').chomp!)
p part2(File.read('data/201503.txt').chomp!)
####

describe 'AOC' do

  #it "part1" do
    #assert_equal 2, part1('>')
    #assert_equal 4, part1('^>v<')
    #assert_equal 2, part1('^v^v^v^v^v')
  #end

  it "part2" do
    assert_equal 3, part2('^v')
    assert_equal 3, part2('^>v<')
    assert_equal 11, part2('^v^v^v^v^v')
  end

end

