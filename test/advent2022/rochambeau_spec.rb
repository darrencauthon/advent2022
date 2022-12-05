# frozen_string_literal: true

require 'test_helper'

describe Advent2022::Rochambeau do
  let(:rochambeau) { Advent2022::Rochambeau.new }

  it 'paper beats rock' do
    _(rochambeau.winner(:paper, :rock)).must_equal 1
    _(rochambeau.winner(:rock, :paper)).must_equal 2
  end
end
