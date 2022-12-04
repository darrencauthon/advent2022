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

      it 'should set the calorie totals' do
        _(elves[0].calories).must_equal 6000
        _(elves[1].calories).must_equal 4000
        _(elves[2].calories).must_equal 11_000
        _(elves[3].calories).must_equal 24_000
        _(elves[4].calories).must_equal 10_000
      end
    end
  end
end
