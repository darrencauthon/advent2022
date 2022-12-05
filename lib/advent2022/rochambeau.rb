# frozen_string_literal: true

class Advent2022::Rochambeau
  def winner(player_one, player_two)
    plays = [player_one, player_two]
    return player_one == :rock ? 1 : 2 if plays.include?(:scissors)

    player_one == :paper ? 1 : 2
  end
end
