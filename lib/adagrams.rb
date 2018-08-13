

def draw_letters

  pool = ('A'*9 + 'B'*2 + 'C'*2 + 'D'*4 + 'E'*12 + 'F'*2 + 'G'*3 + 'H'*2 + 'I'*9 + 'J' + 'K' + 'L'*4 + 'M'*2 + 'N'*6 + 'O'*8 + 'P'*2 + 'Q' + 'R'*6 + 'S'*4 + 'T'*6 + 'U'*4 + 'V'*2 + 'W'*2 + 'X' + 'Y'*2 + 'Z').chars

  pool.shuffle!

  return pool.pop(10)
end


def uses_available_letters?(input, letters_in_hand)
  input.upcase.chars.each do |char|
    if letters_in_hand.include? char
      check_index = letters_in_hand.index(char)
      letters_in_hand.delete_at(check_index)

    else
      return false
    end
  end
  return true
end

input = "tza"
letters_in_hand = ["A", "M", "C", "C", "T", "Z"]

puts uses_available_letters?(input, letters_in_hand)
