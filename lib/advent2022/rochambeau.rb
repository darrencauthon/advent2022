# frozen_string_literal: true

class Advent2022::Rochambeau
  def winner(player_one, player_two)
    return 1 if one_beats_two(player_one, player_two)

    2
  end

  private

  def one_beats_two(one, two)
    return true if one == :paper && two == :rock
    return true if one == :rock && two == :scissors
    return true if one == :scissors && two == :paper
  end
end
