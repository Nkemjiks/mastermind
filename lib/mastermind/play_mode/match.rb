module Mastermind
	module MatchPartial
		extend self
		
		def match(first_array, second_array, mode)
				if mode == "b"
						third_array = []
						fourth_array = []

						partial = 0
						exact = 0

						for i in 0..(first_array.length - 1)
								if (first_array[i] == second_array[i])
										exact += 1
								else
										third_array.push(first_array[i])
										fourth_array.push(second_array[i])
								end
						end

						if (third_array.length != 0)
								r = third_array.count("r")
								g = third_array.count("g")
								b = third_array.count("b")
								y = third_array.count("y")

								for j in 0..(third_array.length - 1)
										if third_array.include?(fourth_array[j])
												if fourth_array[j] == "r" and r > 0
														partial += 1
														r -= 1
												elsif fourth_array[j] == "g" and g > 0
														partial += 1
														g -= 1
												elsif fourth_array[j] == "b" and b > 0
														partial += 1
														b -= 1
												elsif fourth_array[j] == "y" and y > 0
														partial += 1
														y -= 1
												end
										end
								end
						end
						return exact, partial
				elsif (mode == "m") || (mode == "a")
						third_array = []
						fourth_array = []

						partial = 0
						exact = 0

						for i in 0..(first_array.length - 1)
								if (first_array[i] == second_array[i])
										exact += 1
								else
										third_array.push(first_array[i])
										fourth_array.push(second_array[i])
								end
						end

						if (third_array.length != 0)
								r = third_array.count("r")
								g = third_array.count("g")
								b = third_array.count("b")
								y = third_array.count("y")
								c = third_array.count("c")
								m = third_array.count("m")

								for j in 0..(third_array.length - 1)
										if third_array.include?(fourth_array[j])
												if fourth_array[j] == "r" and r > 0
														partial += 1
														r -= 1
												elsif fourth_array[j] == "g" and g > 0
														partial += 1
														g -= 1
												elsif fourth_array[j] == "b" and b > 0
														partial += 1
														b -= 1
												elsif fourth_array[j] == "y" and y > 0
														partial += 1
														y -= 1
												elsif fourth_array[j] == "c" and c > 0
														partial += 1
														c -= 1
												elsif fourth_array[j] == "m" and m > 0
														partial += 1
														m -= 1
												end
										end
								end
						end
						return exact, partial
				end
		end
	end
end