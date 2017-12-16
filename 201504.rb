require 'minitest/autorun'
require 'digest'

# http://adventofcode.com/2015/day/4


def part1(i)
  number = 0
  loop do
    hash = Digest::MD5.hexdigest("#{i}#{number}")
    break number if hash =~ /^00000/
    number += 1
  end
end


def part2(i)
  number = 0
  loop do
    hash = Digest::MD5.hexdigest("#{i}#{number}")
    break number if hash =~ /^000000/
    number += 1
  end
end


####
#p part1('iwrupvqb') # 346386
p part2('iwrupvqb') # 
####

describe 'this' do

  it "does things" do
  end

  it "does things" do
  end


end
