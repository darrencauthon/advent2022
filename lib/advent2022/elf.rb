# frozen_string_literal: true

class Advent2022::Elf
  attr_reader :calories

  def self.from_calories(calorie_list)
    calorie_list
      .split("\n\n")
      .map { |x| x.split("\n").map(&:to_i).sum }
      .map { |x| new(calories: x) }
  end

  def initialize(calories:)
    @calories = calories
  end

  def find_someone_to_ask_for_snacks(elves)
    elves.reject { |e| e.object_id == object_id }.max_by(&:calories)
  end
end
