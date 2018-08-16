
# adds csv gem
require "csv"

# initialize global variable
$words_hash = {}

def draw_letters

  # letter pool
  pool = ('A'*9 + 'B'*2 + 'C'*2 + 'D'*4 + 'E'*12 + 'F'*2 + 'G'*3 + 'H'*2 + 'I'*9 + 'J' + 'K' + 'L'*4 + 'M'*2 + 'N'*6 + 'O'*8 + 'P'*2 + 'Q' + 'R'*6 + 'S'*4 + 'T'*6 + 'U'*4 + 'V'*2 + 'W'*2 + 'X' + 'Y'*2 + 'Z').chars

  # randomize letters
  # return the first 10 letters from randomized pool
  return pool.shuffle.pop(10)
end


def uses_available_letters?(input, letters)
  # input --> user's word (string)
  # letters --> available letters in pool

  # made a clone(?) of letters; previously, we ran into pointer/duplication issues
  # we don't want to alter letters since it needs to reset with all 10 pulled letters available
  letters_copy = letters.clone

  # check through each character; is it available?
  input.upcase.chars.each do |char|
    if letters_copy.include? char

      # delete letter once user inputs it
      check_index = letters_copy.index(char)
      letters_copy.delete_at(check_index)

    else
    # return false if user does NOT have available lettesr for input
      return false
    end
  end
  # return true if user has available letters for input
  return true
end

def score_word(word)
  # word --> string; user's input word


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
  score = word.upcase.chars.sum do |char|
    score_chart[char]
  end

  # add eight extra points for words 7+ in length
  if word.length >= 7
    score += 8
  end

  # return score as int
  return score
end


def highest_score_from(words)
  # word --> string; user's input word

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
    # check that the lengths are unequal, since that matters for winning

      elsif score_word(word) == highest_score && word.length != best_word.length



      # check if highest scoring word length is 10; if so, that's the winning word
      # check that word length is less than best word's length AND that it does not equal 10
      # if there is a tie between two high scoring words (and the current best word is not a length 10; otherwise, it wins), then choose the shortest length
      if (word.length == 10) || (word.length < best_word.length && best_word.length != 10)
        highest_score = score_word(word)
        best_word = word
      end
    end
  end

  # return hash containing highest scoring word AND the score for that word
  return {word: best_word,
          score: highest_score}
end



def create_hash()
  # read csv file
  english_words = CSV.open("assets/dictionary-english.csv", "r")

  # iterate through each row in csv file
  english_words.each do |row|
  # each row is an array, so check the 0th index
  # {key, value} --> {"WORD", 0}
    $words_hash[row[0].upcase] = 0
  end
end

def is_in_english_dict?(input)
  # input --> string; user's input word

  # if it returns a value --> true
  # otherwise, false
  $words_hash.include?(input.upcase) ? true : false

  # NOTE: we did this first, but decided to create a hash for enhanced efficiency
# english_words = CSV.open("assets/dictionary-english.csv", "r")
# english_words.each do |row|
# #   if input.upcase == row[0].upcase
# return true if word is in dictionary (csv file)
#     return true
#   end
# return false

end

create_hash()
