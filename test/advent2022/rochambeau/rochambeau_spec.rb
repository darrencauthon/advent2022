# frozen_string_literal: true

require 'test_helper'

describe Advent2022::Rochambeau do
  let(:rochambeau) { Advent2022::Rochambeau.new }

  it 'paper beats rock' do
    _(rochambeau.winner(:paper, :rock)).must_equal 0
    _(rochambeau.winner(:rock, :paper)).must_equal 1
  end

  it 'rock beats scissors' do
    _(rochambeau.winner(:rock, :scissors)).must_equal 0
    _(rochambeau.winner(:scissors, :rock)).must_equal 1
  end

  it 'scissors beat paper' do
    _(rochambeau.winner(:scissors, :paper)).must_equal 0
    _(rochambeau.winner(:paper, :scissors)).must_equal 1
  end

  it 'ties get no winner' do
    _(rochambeau.winner(:paper, :paper)).must_be_nil
    _(rochambeau.winner(:rock, :rock)).must_be_nil
    _(rochambeau.winner(:scissors, :scissors)).must_be_nil
  end

  describe 'overriding the words' do
    let(:paper) { SecureRandom.uuid }
    let(:rock) { SecureRandom.uuid }
    let(:scissors) { SecureRandom.uuid }

    let(:rochambeau) do
      Advent2022::Rochambeau.new(rock: rock, paper: paper, scissors: scissors)
    end

    it 'paper beats rock' do
      _(rochambeau.winner(paper, rock)).must_equal 0
      _(rochambeau.winner(rock, paper)).must_equal 1
    end

    it 'rock beats scissors' do
      _(rochambeau.winner(rock, scissors)).must_equal 0
      _(rochambeau.winner(scissors, rock)).must_equal 1
    end

    it 'scissors beat paper' do
      _(rochambeau.winner(scissors, paper)).must_equal 0
      _(rochambeau.winner(paper, scissors)).must_equal 1
    end

    it 'ties get no winner' do
      _(rochambeau.winner(paper, paper)).must_be_nil
      _(rochambeau.winner(rock, rock)).must_be_nil
      _(rochambeau.winner(scissors, scissors)).must_be_nil
    end
  end

  describe 'scoring' do
    it 'paper beats rock, 6 + 2' do
      _(rochambeau.score(:paper, :rock)).must_equal [6 + 2, 1]
      _(rochambeau.score(:rock, :paper)).must_equal [1, 6 + 2]
    end

    it 'rock beats scissors, 6 + 1' do
      _(rochambeau.score(:rock, :scissors)).must_equal [6 + 1, 3]
      _(rochambeau.score(:scissors, :rock)).must_equal [3, 6 + 1]
    end

    it 'scissors beat paper, 6 + 3' do
      _(rochambeau.score(:scissors, :paper)).must_equal [6 + 3, 2]
      _(rochambeau.score(:paper, :scissors)).must_equal [2, 6 + 3]
    end

    it 'ties get 6 points per player' do
      _(rochambeau.score(:paper, :paper)).must_equal [3 + 2, 3 + 2]
      _(rochambeau.score(:rock, :rock)).must_equal [3 + 1, 3 + 1]
      _(rochambeau.score(:scissors, :scissors)).must_equal [3 + 3, 3 + 3]
    end
  end
end
