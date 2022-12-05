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
end
