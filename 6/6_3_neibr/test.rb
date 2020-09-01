# frozen_string_literal: true

require 'faker'
require 'minitest/autorun'

require './main'
require './user'

class TestNeibr < Minitest::Test
  def test_raises_argument_error_if_not_numbers_given
    assert_raises ArgumentError do
      neibr [[1, 'sd']]
    end
  end

  def test_returns_correct_values_if_block_given
    belongs = [1.0, 0.84]
    not_belongs = [7.0, 9.0]
    assert_equal(
      [[belongs, true], [not_belongs, false]],
      neibr([belongs, not_belongs], PRECISION) { |x| Math.sin(x**2) }
    )
  end

  def test_returns_correct_values_if_proc_given
    belongs = [1.0, 0.54]
    not_belongs = [-9.0, 100.0]
    assert_equal(
      [[belongs, true], [not_belongs, false]], neibr([belongs, not_belongs], PRECISION, proc { |x| Math.cos(x) })
    )
  end

  def test_returns_false_if_no_block_or_proc_given
    point = [Faker::Number.positive, Faker::Number.positive]
    assert_equal [[point, false]], neibr([point], PRECISION)
  end

  private

  attr_reader :precision
end
