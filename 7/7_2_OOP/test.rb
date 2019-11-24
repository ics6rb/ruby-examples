# frozen_string_literal: true

require 'faker'
require 'minitest/autorun'
require './main.rb'

class TestRectangle < Minitest::Test
  def test_square_returns_true_if_length_eq_to_width
    assert_equal true, Rectangle.new(1, 1).square?
  end

  def test_square_returns_false_if_length_neq_to_width
    assert_equal false, Rectangle.new(1, 2).square?
  end
end

class TestRectangularBox < Minitest::Test
  def test_kind_of_rectangle
    assert_kind_of Rectangle, RectangularBox.new(1, 1, 1)
  end

  def test_square_does_not_depend_on_length_and_width
    assert_equal false, RectangularBox.new(1, 2, 3).square?
    assert_equal false, RectangularBox.new(1, 1, 3).square?
  end

  def test_type_returns_cube_if_all_dims_equal
    assert_equal 'куб', RectangularBox.new(1, 1, 1).type
  end

  def test_type_returns_rect_box_if_not_all_dims_equal
    assert_equal 'прямоугольный параллелипипед', RectangularBox.new(1, 2, 3).type
    assert_equal 'прямоугольный параллелипипед', RectangularBox.new(1, 1, 3).type
    assert_equal 'прямоугольный параллелипипед', RectangularBox.new(1, 2, 1).type
    assert_equal 'прямоугольный параллелипипед', RectangularBox.new(1, 2, 2).type
  end
end
