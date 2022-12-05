# frozen_string_literal: true

class Advent2022::RochambeauStrategyGuide
  attr_reader :rochambeau

  def initialize
    @rochambeau = Advent2022::Rochambeau.new(rock: 0, paper: 1, scissors: 2)
  end

  def moves(guide)
    start = %w[A X]

    guide
      .split("\n")
      .map(&:split)
      .map { |x| x.each_with_index.map { |y, i| y.ord - start[i].ord } }
      .map(&:reverse) # the guide shows opponents first
  end

  def score(guide)
    moves(guide)
      .map { |x| rochambeau.score(*x) }
      .map(&:first)
      .sum
  end
end

class Advent2022::RochambeauStrategyGuideVersionTwo < Advent2022::RochambeauStrategyGuide
  def moves(guide)
    mapping = { 0 => :lose, 1 => :tie, 2 => :beat }
    super.map do |x, y|
      [send(mapping[x], y), y]
    end
  end

  def beat(move)
    return 1 if move.zero?
    return 2 if move == 1

    0
  end

  def lose(move)
    [0, 1, 2].reject { |x| x == move }.reject { |x| x == beat(move) }.first
  end

  def tie(move)
    move
  end
end
