module Mastermind
  class Game
    class << self
      include Instructions
      include Gameplay
      include Gamelog

      def start
        show_options_message
        selected_option = gets.chomp

        case selected_option
        when 'p'
          play_game
        when 'i'
          show_instruction
        when 'l'
          show_leader_board
        when 'q'
          quit_message
          exit
        else
          invalid_entry
        end
      end

      def play_game
        select_difficulty_message
        difficulty = gets.chomp
        set_difficulty(difficulty)
      end

      def set_difficulty(difficulty)
        case difficulty 
        when 'b'
          start_beginner_game ? start : nil
        when 'm'
          start_intermidiate_game ? start : nil
        when "a"
          start_advance_game ? start : nil
        else
          invalid_entry_message
          play_game
        end
      end

      def show_instruction
        how_to_play_message
        start
      end

      def show_leader_board
        read_gamelog
        start
      end

      def invalid_entry
        invalid_entry_message
        start
      end
    end
  end
end