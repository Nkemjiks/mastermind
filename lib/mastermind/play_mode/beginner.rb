module Mastermind
	module BeginnerLevel
		extend self

		include MatchPartial
		include Instructions
		include Gamelog

		def beginner
			round = 1
			hint_count = 1
			full_round = 12
			color_combination = ["r", "g", "b", "y"]
			generated_sequence = []
			i = 1
			while i <= 4
				generated_sequence.push(color_combination[rand(0..3)])
				i += 1
			end
			hint = hint_message(generated_sequence)[0]
			mode_instruction_beginner
			start_time = Time.now
			while round <= full_round
				chosen_sequence = gets.chomp
				if chosen_sequence == "q"
					quit_message
					break
				elsif chosen_sequence == "h"
					if hint_count == 1
						hint_count -= 1
						puts hint
						hint_count_message(hint_count)
					else
						exceed_hint_message
					end
				elsif chosen_sequence.length < 4
					sequence_input_short_length_message
					next
				elsif chosen_sequence.length > 4
					sequence_input_long_length_message
					next
				else
					split_chosed_sequence = chosen_sequence.split("")
					result = match(generated_sequence, split_chosed_sequence, "b")
					exact_match = result[0]
					partial_match = result[1]
					if round > 12
						finish = Time.now
						diff = finish - start_time
						lose_game(split_chosed_sequence, round, exact_match, partial_match, diff, generated_sequence)
						return true
						break
					elsif exact_match == 4 and round <= 12
						finish = Time.now
						diff = finish - start_time
						win_game(split_chosed_sequence, round, exact_match, partial_match, diff, generated_sequence)
						name = gets.chomp
						write_gamelog(name, split_chosed_sequence, round, diff)
						return true
						break
					else
						next_round(split_chosed_sequence, round, exact_match, partial_match)
						round += 1
						next
					end
				end
			end
		end
	end
end