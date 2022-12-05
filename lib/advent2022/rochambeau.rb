# frozen_string_literal: true

class Advent2022::Rochambeau
  def winner(player_one, _player_two)
    player_one == :paper ? 1 : 2
  end
end
