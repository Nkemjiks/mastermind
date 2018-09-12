module Mastermind
	module SessionCheck
		extend self

    include Instructions
    
		def player_input(user_input, difficulty, hint_count, generated_colors)
      if user_input == "q"
        quit_message
        exit
      elsif user_input == "h"
        if hint_count > 0
          hint = hint_message(generated_colors)
          puts hint[rand(0..(difficulty - 4))]
          hint_count -= 1
          hint_count_message(hint_count)
          return true, hint_count
        else
          hint_count_message(hint_count)
          return true
        end
      elsif user_input.length < difficulty
        sequence_input_short_length_message
        return true
      elsif user_input.length > difficulty
        sequence_input_long_length_message
        return true
      end

      colors = %w(r g b y c m)
      user_input_array_split = user_input.split('')

      is_valid_colors = user_input_array_split.all?{ |color| colors.include?(color) }

      if !is_valid_colors
        puts "Invalid Entry, Try again"
        return true
      end
    end
	end
end