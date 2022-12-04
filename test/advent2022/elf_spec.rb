# frozen_string_literal: true

require 'test_helper'

describe Advent2022::Elf do
  describe :from_calories do
    describe 'given example' do
      let(:calorie_list) do
        <<~TEXT
          1000
          2000
          3000

          4000

          5000
          6000

          7000
          8000
          9000

          10000
        TEXT
      end

      let(:elves) { Advent2022::Elf.from_calories(calorie_list) }

      it 'should create five elves' do
        _(elves.count).must_equal 5
        _(elves.select { |x| x.is_a?(Advent2022::Elf) }.count).must_equal 5
      end
    end
  end
end
