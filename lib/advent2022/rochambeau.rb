# frozen_string_literal: true

class Advent2022::Rochambeau
  attr_reader :rock, :paper, :scissors

  def initialize(rock: :rock, paper: :paper, scissors: :scissors)
    @rock = rock
    @paper = paper
    @scissors = scissors
  end

  def winner(player_one, player_two)
    return nil if player_one == player_two

    one_beats_two(player_one, player_two) ? 0 : 1
  end

  def score(player_one, player_two)
    return [3, 3] unless winner(player_one, player_two) || winner(player_two, player_one)

    [
      (winner(player_one, player_two).zero? ? 6 : 0) + score_for(player_one),
      (winner(player_two, player_one).zero? ? 6 : 0) + score_for(player_two)
    ]
  end

  private

  def one_beats_two(one, two)
    return true if one == paper && two == rock
    return true if one == rock && two == scissors
    return true if one == scissors && two == paper
  end

  def score_for(play)
    return 3 if play == scissors

    play == rock ? 1 : 2
  end
end
