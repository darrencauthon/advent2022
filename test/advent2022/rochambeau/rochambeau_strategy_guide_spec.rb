# frozen_string_literal: true

require_relative '../../test_helper'

describe Advent2022::RochambeauStrategyGuide do
  let(:strategy_guide) { Advent2022::RochambeauStrategyGuide.new }

  describe 'given example' do
    let(:guide) do
      <<~TEXT
        A Y
        B X
        C Z
      TEXT
    end

    let(:score) { strategy_guide.score(guide) }

    it 'should get a total score of 12' do
      _(score).must_equal 12
    end
  end
end
