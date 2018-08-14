
# adds csv gem
require "csv"

def draw_letters

  # letter pool
  pool = ('A'*9 + 'B'*2 + 'C'*2 + 'D'*4 + 'E'*12 + 'F'*2 + 'G'*3 + 'H'*2 + 'I'*9 + 'J' + 'K' + 'L'*4 + 'M'*2 + 'N'*6 + 'O'*8 + 'P'*2 + 'Q' + 'R'*6 + 'S'*4 + 'T'*6 + 'U'*4 + 'V'*2 + 'W'*2 + 'X' + 'Y'*2 + 'Z').chars

  # randomize letters
  pool.shuffle!

  return pool.pop(10)
end


def uses_available_letters?(input, letters)
  # check through each character; is it available?
  letters_altered = letters.clone

  input.upcase.chars.each do |char|
    if letters_altered.include? char

      # delete letter once user inputs it
      check_index = letters_altered.index(char)
      letters_altered.delete_at(check_index)

    else
      return false
    end
  end
  return true
end

def score_word(word)
  # initialize scoring value
  score = 0

  # create scoring chart
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

  # add scores together
  word.upcase.chars.each do |char|
    score += score_chart[char]
  end

  # add eight extra points for words 7+ in length
  if word.length >= 7
    score += 8
  end

  return score
end


def highest_score_from(words)

  # initializing values
  highest_score = 0
  best_word = ''

  # loop through each word in array of user input
  words.each do |word|


    if score_word(word) > highest_score

      # if we have found the highest scoring word, set variable equal to that score and that word
      highest_score = score_word(word)
      best_word = word

    # check for score ties
    elsif score_word(word) == highest_score

      # check that the lengths are unequal, since that matters for winning
      if word.length != best_word.length
      # check if highest scoring word length is 10; if so, that's the winning word
        if word.length == 10
          highest_score = score_word(word)
          best_word = word

        end

        # check that word length is less than best word's length AND that it does not equal 10
        # if there is a tie between two high scoring words (and the current best word is not a length 10; otherwise, it wins), then choose the shortest length
        if word.length < best_word.length && best_word.length != 10
          highest_score = score_word(word)
          best_word = word

        end
      end
    end
  end

  return {:word => best_word,
          :score => highest_score}
end

def is_in_english_dict?(input)

# iterate through each row in csv file
# each row is an array, so check the 0th index
  english_words = CSV.open("assets/dictionary-english.csv", "r")
  english_words.each do |row|

  # check if user input word is found within dictionary
    if input.upcase == row[0].upcase
      return true

    end
  end

  return false


end

puts is_in_english_dict?('cat')
