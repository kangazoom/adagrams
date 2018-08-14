

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

def score_word(word)
  score = 0

  score_chart = {
    "A" => 1,
    "B" => 3,
    "C" => 3,
    "D" => 2,
    "E" => 1,
    "F" => 4,
    "G" => 2,
    "H" => 4,
    "I" => 1,
    "J" => 8,
    "K" => 5,
    "L" => 1,
    "M" => 3,
    "N" => 1,
    "O" => 1,
    "P" => 3,
    "Q" => 10,
    "R" => 1,
    "S" => 1,
    "T" => 1,
    "U" => 1,
    "V" => 4,
    "W" => 4,
    "X" => 8,
    "Y" => 4,
    "Z" => 10
    }

  word.upcase.chars.each do |char|
    score += score_chart[char]
  end

  if word.length >= 7
    score += 8
  end

  return score
end

input = "cat"
letters_in_hand = ["A", "M", "C", "C", "T", "Z"]
puts uses_available_letters?(input, letters_in_hand)


puts score_word("parameter")
