require 'minitest/autorun'


#http://adventofcode.com/2015/day/6


#turn on 887,9 through 959,629
#turn off 539,243 through 559,965
#toggle 720,196 through 897,994

REGEXP_COMMAND = %r{
(?<instr>turn\son|turn\soff|toggle)
\s
(?<x1>\d{1,3}),(?<y1>\d{1,3})
\sthrough\s
(?<x2>\d{1,3}),(?<y2>\d{1,3})
}x


def parse_instruction(i)
  REGEXP_COMMAND.match(i)&.named_captures
end


def get_points(x1:, y1:, x2:, y2:)
  return 1 if (x1 == x2) && (y1 == y2)
  (x2 - x1 + 1) * (y2 - y1 + 1)
  points = []
  x1.upto(x2) do |x|
    y1.upto(y2) { |y| points << [x, y] }
  end
  points
end


def part1(grid, instr:, x1:, y1:, x2:, y2:)
  points = get_points(x1: x1, y1: y1, x2: x2, y2: y2) #[[1, 2], [1, 3], [1, 4], [3, 3]]
  points.each do |(x, y)|
    case instr
    when 'turn on'
      grid[x][y] = 1
    when 'turn off'
      grid[x][y] = 0
    when 'toggle'
      grid[x][y] = 1 - grid[x][y]
    end
  end
end


def part2(grid, instr:, x1:, y1:, x2:, y2:)
  points = get_points(x1: x1, y1: y1, x2: x2, y2: y2) #[[1, 2], [1, 3], [1, 4], [3, 3]]
  points.each do |(x, y)|
    case instr
    when 'turn on'
      grid[x][y] += 1
    when 'turn off'
      grid[x][y] = [grid[x][y] - 1, 0].max
    when 'toggle'
      grid[x][y] += 2
    end
  end
end


####

row = 1000
col = 1000
grid = Array.new(row) { Array.new(col, 0) }

#File.foreach('data/201506.txt') do |command|
  #tokens = parse_instruction(command)
  #part1(grid, instr: tokens['instr'], x1: tokens['x1'].to_i, y1: tokens['y1'].to_i, x2: tokens['x2'].to_i, y2: tokens['y2'].to_i)
#end

#p grid.flatten.count { |e| e == 1 }

####


File.foreach('data/201506.txt') do |command|
  tokens = parse_instruction(command)
  part2(grid, instr: tokens['instr'], x1: tokens['x1'].to_i, y1: tokens['y1'].to_i, x2: tokens['x2'].to_i, y2: tokens['y2'].to_i)
end

p grid.flatten.reduce(:+)

####


class TestThis < Minitest::Test

  def test_part1
    #assert_equal 1, get_points(2, 2, 2, 2)
    #assert_equal 9, get_points(0, 0, 2, 2)
    #assert_equal 1_000_000, get_points(0, 0, 999, 999)
    #assert_equal 1_000, get_points(0, 0, 999, 0)
    #assert_equal 4, get_points(499, 499, 500, 500)
  end

  def test_part2
  end

end
