module Mastermind
  # Instructions module
  module Instructions
    module_function

    def introductions
      puts '     -----          -            ----- -       -'
      puts '    |     |---  ---|  |_ ___ ___|     |_|___ _| |'
      puts '    | | | | . \'|_ -|  _ | -_|  _| | | | |   | . |'
      puts '    |_|_|_|__, |___|_|  |___|_| |_|_|_|_|_|_|___|'

      puts 'Welcome to Mastermind'
    end

    def show_options_message
      puts 'Press (p) to play, (i) to read the instructions, (l) to view gamelog  or (q) to quit?'
    end

    def select_difficulty_message
      puts 'Select difficulty level, (b)eginner, (m)medium or (a)dvance'
    end

    def beginner_mode_instruction
      puts 'I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue and (y)ellow Use (h) to get hints, you have 1 hint. Use (q)uit at any time to end the game.'
    end

    def intermediate_mode_instruction
      puts 'I have generated an intermidiate sequence with six elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (c)yanand (m)agenta. Use (h) to get hints, you have 3 hint. Use (q)uit at any time to end the game.'
    end

    def advance_mode_instruction
      puts 'I have generated an advance sequence with eight elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (c)yan, and (m)agenta. Use (h) to get hints, you have 5 hint. Use (q)uit at any time to end the game.'
    end

    def win_game(split_chosed_sequence, round, exact_match, partial_match, diff, generated_sequence)
      puts "You played #{split_chosed_sequence}. Round #{round} 0f 12"
      puts "You have #{exact_match} exact match(es) and #{partial_match} partial match(es)"
      puts "     #{'*' * 10} WINNER!!! #{'*' * 10}"
      puts "        You won in #{diff.ceil} seconds within #{round} rounds"
      puts "        The computer chose #{generated_sequence}"
      puts 'Please enter your name'
    end

    def lose_game(split_chosed_sequence, round, exact_match, partial_match, diff, generated_sequence)
      puts "You played #{split_chosed_sequence}. Round #{round} 0f 12"
      puts "You have #{exact_match} exact match(es) and #{partial_match} partial match(es)"
      puts "     #{'*' * 10} LOSER!!! #{'*' * 10}"
      puts "        You played for #{diff.ceil} seconds within #{round} rounds"
      puts "        The computer chose #{generated_sequence}"
    end

    def next_round(split_chosed_sequence, round, exact_match, partial_match)
      puts "You played #{split_chosed_sequence}. Round #{round} 0f 12"
      puts "You have #{exact_match} exact match(es) and #{partial_match} partial match(es)"
    end

    def how_to_play_message
      puts '      This is Mastermind'
      puts '      ** The Computer has chosen a set of colors, and the aim of the game is for you to find out those colors.'
      puts '      ** You can press (h) to get a clue to the get the Computer\'s choice at the cost of a turn.'
      puts '      ** You win when you guess all the Computer\'s choice correctly.'
      puts '      ** You loose if you dont get the correct computer\'s choice after 12 rounds.'
      puts '      ** Exact matches mean you guesed the right color at the right spot.'
      puts '      ** Partial matches mean you guesed the write color but not on the right spot.'
      puts '      *** Happy playing ***'
    end

    def sequence_input_short_length_message
      puts 'Your input is too short'
    end

    def hint_count_message(hint_count)
      if hint_count > 0
        puts "You have #{hint_count} hint(s) left"
      else
        puts 'You cannot get anymore hint'
      end
    end

    def sequence_input_long_length_message
      puts 'Your input is too long'
    end

    def hint_message(generated_sequence, hint)
      puts "#{generated_sequence[hint - 1]} is at position #{hint} in the computer's choice"
    end

    def invalid_entry_message
      puts 'Invalid entry, try again'
    end

    def quit_message
      puts 'You have quit the game'
    end
  end
end
