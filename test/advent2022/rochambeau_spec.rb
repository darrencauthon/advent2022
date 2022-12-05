# frozen_string_literal: true

require 'test_helper'

describe Advent2022::Rochambeau do
  let(:rochambeau) { Advent2022::Rochambeau.new }

  it 'paper beats rock' do
    _(rochambeau.winner(:paper, :rock)).must_equal 1
    _(rochambeau.winner(:rock, :paper)).must_equal 2
  end

  it 'rock beats scissors' do
    _(rochambeau.winner(:rock, :scissors)).must_equal 1
    _(rochambeau.winner(:scissors, :rock)).must_equal 2
  end

  it 'scissors beat paper' do
    _(rochambeau.winner(:scissors, :paper)).must_equal 1
    _(rochambeau.winner(:paper, :scissors)).must_equal 2
  end

  it 'ties get no winner' do
    _(rochambeau.winner(:paper, :paper)).must_equal 0
    _(rochambeau.winner(:rock, :rock)).must_equal 0
    _(rochambeau.winner(:scissors, :scissors)).must_equal 0
  end
end
