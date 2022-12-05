# frozen_string_literal: true

class Advent2022::RochambeauStrategyGuide
  attr_reader :rochambeau

  def initialize
    @rochambeau = Advent2022::Rochambeau.new(rock: 0, paper: 1, scissors: 2)
  end

  def score(guide)
    start = %w[A X]

    guide
      .split("\n")
      .map(&:split)
      .map { |x| x.each_with_index.map { |y, i| y.ord - start[i].ord } }
      .map(&:reverse) # the guide shows opponents first
      .map { |x| rochambeau.score(*x) }
      .map(&:first)
      .sum
  end
end