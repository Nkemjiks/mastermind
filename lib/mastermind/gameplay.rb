module Mastermind
  module Gameplay
    extend self

    include Instructions
    include Gamelog
    include SessionCheck

    def start_beginner_game
      start_game(4)
    end

    def start_intermidiate_game
      start_game(6)
    end

    def start_advance_game
      start_game(8)
    end


    def start_game(difficulty)
      generated_colors = generate_colors(difficulty)
      round = 1
      full_round = 12
      hint_count = difficulty == 8 ? 5 : difficulty == 6 ? 3 : 1
      start_time = Time.now
      p generated_colors
      loop do
        puts "Round #{'*' *  10} #{round} #{'*' *  10}"
        user_input = gets.chomp

        player_input_response = player_input(user_input, difficulty, hint_count, generated_colors)
        hint_count = player_input_response.is_a?(Array) ? player_input_response[1] : hint_count
        should_next = player_input_response.is_a?(Array) ? player_input_response[0] : player_input_response
        next if should_next

        user_input_array = user_input.split('')
        exact_matches = get_exact_matches(generated_colors.dup, user_input_array)
        partial_matches = get_partial_matches(exact_matches[0], user_input_array)

        if round > 12
          finish = Time.now
          time_diff = finish - start_time
          lose_game(user_input_array, round, exact_matches[1], partial_matches, time_diff, generated_colors)
          break
        elsif exact_matches[1] == generated_colors.length
          finish = Time.now
          time_diff = finish - start_time
          win_game(user_input_array, round, exact_matches[1], partial_matches, time_diff, generated_colors)
          name = gets.chomp
          write_gamelog(name, user_input_array, round, time_diff)
          break
        else
          next_round(user_input_array, round, exact_matches[1], partial_matches)
          round += 1
          next
        end
      end
      Game.start
    end

    def get_exact_matches(generated_colors, user_input)
      exact_match_count = 0

      user_input.each_with_index do |_, index|
        if generated_colors[index] == user_input[index]
          generated_colors[index] = '*'
          exact_match_count += 1
        end
      end

      [generated_colors, exact_match_count]
    end

    def get_partial_matches(generated_colors, user_input)
      partial_match_count = 0

      user_input.each_with_index do |input, index|
        match_index = generated_colors.index(input)
        
        next if match_index.nil?

        generated_colors[match_index] = '#'
        partial_match_count += 1
      end

      partial_match_count
    end

    def generate_colors(difficulty)
      colors = %w(r g b y c m)
      generated_colors = []
      selection_limit = difficulty > colors.size ? colors.size : difficulty

      until generated_colors.size == difficulty
        index = Random.rand(0...selection_limit)
        generated_colors << colors[index]
      end

      generated_colors
    end

  end
end