# frozen_string_literal: true

class Rectangle
  attr_reader :length, :width

  def initialize(length, width)
    @length = length
    @width = width
  end

  def square?
    length == width
  end
end

class RectangularBox < Rectangle
  attr_reader :height

  def initialize(length, width, height)
    super length, width
    @height = height
  end

  def square?
    false
  end

  def type
    if length == width && width == height
      'куб'
    else
      'прямоугольный параллелипипед'
    end
  end
end
