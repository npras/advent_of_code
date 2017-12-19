r = %r{
(?<instr>turn\son|turn\soff|toggle)
\s
(?<x1>\d{1,3}),(?<y1>\d{1,3})
\sthrough\s
(?<x2>\d{1,3}),(?<y2>\d{1,3})
}x

i = 'turn on 887,9 through 959,629'

md = r.match(i)

p md
