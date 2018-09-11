module Mastermind
  module Gameplay
    extend self

    include BeginnerLevel
    include IntermediateLevel
    include AdvanceLevel

    def start_beginner_game
      beginner
    end

    def start_intermidiate_game
      intermediate
    end

    def start_advance_game
      advance
    end
  end
end