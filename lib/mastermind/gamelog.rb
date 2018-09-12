module Mastermind
	module Gamelog
		extend self

		def write_gamelog(name, sequence, rounds, seconds)
			File.open("gamelog.txt", "a+") do |line| 
				line.puts "#{name} guessed the sequence #{sequence} in #{rounds} rounds within #{seconds.ceil} seconds\n"
			end
		end

		def read_gamelog
			if File.zero?("gamelog.txt")
				puts "No gamelog yet"
			else
				File.open("gamelog.txt").each do |line| 
					puts line
				end
			end
		end

	end
end