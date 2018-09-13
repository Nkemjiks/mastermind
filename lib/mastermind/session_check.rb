module Mastermind
  # Session Module
  module SessionCheck
    module_function

    include Instructions

    def player_input(difficulty, hint_count, generated_colors)
      user_input = gets.chomp
      colors = %w[r g b y c m]

      if user_input == 'q'
        quit_message
        exit
      elsif user_input == 'h'
        check_hint(difficulty, hint_count, generated_colors)
      elsif user_input.length < difficulty
        sequence_input_short_length_message
      elsif user_input.length > difficulty
        sequence_input_long_length_message
      elsif user_input.split('').all? { |color| colors.include?(color) } == false
        invalid_entry_message
      else
        user_input.split('')
      end
    end

    def check_hint(difficulty, hint_count, generated_colors)
      if hint_count > 0
        hint = rand(0..(difficulty - 4))
        hint_message(generated_colors, hint)
        hint_count -= 1
      end
      hint_count_message(hint_count)
      player_input(difficulty, hint_count, generated_colors)
    end
  end
end
