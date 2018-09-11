module Mastermind
	module AdvanceLevel
		extend self

		include MatchPartial
		include Gamelog
		include Instructions
		
		def advance
			round = 1
			hint_count = 5
			full_round = 12
			color_combination = ["r", "g", "b", "y", "c", "m"]
			generated_sequence = []
			i = 1
			while i <= 8
				generated_sequence.push(color_combination[rand(0..7)])
				i += 1
			end
			hint = hint_message(generated_sequence)
			advance_mode_instruction
			start = Time.now
			while round <= full_round
				chosen_sequence = gets.chomp
				if chosen_sequence == "q"
					quit_message
					break
				elsif chosen_sequence == "h"
					if hint_count > 0
						hint_count -= 1
						puts hint[rand(0..4)]
						hint_count_message(hint_count)
					else
						exceed_hint_message
					end
				elsif chosen_sequence.length < 8
					sequence_input_short_length_message
					next
				elsif chosen_sequence.length > 8
					sequence_input_long_length_message
					next
				else
					split_chosed_sequence = chosen_sequence.split("")
					result = match(generated_sequence, split_chosed_sequence, "a")
					exact_match = result[0]
					partial_match = result[1]
					if round > 12
						finish = Time.now
						diff = finish - start
						lose_game(split_chosed_sequence, round, exact_match, partial_match, diff, generated_sequence)
						return true
						break
					elsif exact_match == 8 and round <= 12
						finish = Time.now
						diff = finish - start
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