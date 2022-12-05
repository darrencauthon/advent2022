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
    super.map.map { |x| x[1] }.map { |x| [0, x] }
  end
end
