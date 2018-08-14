require_relative 'lib/adagrams'

def display_welcome_message
  puts "Welcome to Adagrams!"
end

def display_drawn_letters(letters)
  puts "You have drawn the letters:"
  puts letters.join(', ')
end

def display_game_instructions
  puts "Please input your submission for the longest anagram you can come up with"
end

def display_not_in_dictionary_message
  puts "You entered in a word that is not contained in the English dictionary"
  display_game_instructions
end

def display_not_in_letter_bank_message
  puts "You entered in a word that contains characters not in the letter bank"
  display_game_instructions
end

def display_score(score)
  puts "Your submitted anagram scored #{score} points"
end

def display_retry_instructions
  puts "Should we play another round?"
  puts "Enter y to replay"
end

def display_highest_score(high_score_hash)
  puts "Thanks for playing Adagrams!"
  puts "The highest score from this game was #{high_score_hash[:word]}, which was worth #{high_score_hash[:score]} points"
end

def display_goodbye_message
  puts "Goodbye!"
end

def get_user_input
  gets.chomp
end

def run_game
  played_words = []

  display_welcome_message

  should_continue = true

  while should_continue
    puts "Let's draw 10 letters from the letter pool..."

    letter_bank = draw_letters
    display_drawn_letters(letter_bank)

    display_game_instructions

    user_input_word = get_user_input

    while ( (!(uses_available_letters?(user_input_word, letter_bank)) ) || (!(is_in_english_dict?(user_input_word))) )

      # puts "Beginning of while loop, letter_bank = #{letter_bank}"
      if !(uses_available_letters?(user_input_word, letter_bank))
        display_not_in_letter_bank_message
      elsif !(is_in_english_dict?(user_input_word))
        display_not_in_dictionary_message
      end

      # puts "End of while loop, letter_bank = #{letter_bank}"

      user_input_word = get_user_input
    end

    score = score_word(user_input_word)
    played_words << user_input_word

    display_score(score)

    display_retry_instructions
    should_continue = get_user_input == "y"
  end

  display_highest_score(highest_score_from(played_words))
  display_goodbye_message
end

run_game
