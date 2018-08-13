

def draw_letters

  pool = ('A'*9 + 'B'*2 + 'C'*2 + 'D'*4 + 'E'*12 + 'F'*2 + 'G'*3 + 'H'*2 + 'I'*9 + 'J' + 'K' + 'L'*4 + 'M'*2 + 'N'*6 + 'O'*8 + 'P'*2 + 'Q' + 'R'*6 + 'S'*4 + 'T'*6 + 'U'*4 + 'V'*2 + 'W'*2 + 'X' + 'Y'*2 + 'Z').chars

  pool.shuffle!

  return pool.pop(10)
end

puts "#{draw_letters}"
