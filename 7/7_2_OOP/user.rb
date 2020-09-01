# frozen_string_literal: true

require './main'

puts 'Введите длину, ширину и высоту через пробел'

params = gets.chomp.split.map { |x| Float x, exception: false }.compact

unless params.size == 3
  puts 'Некорректный ввод'
  exit 1
end

length, width, height = params
rectangle = Rectangle.new length, width
rectangular_box = RectangularBox.new length, width, height

puts 'Параметры прямоугольника:'
puts "длина: #{rectangle.length}, ширина: #{rectangle.width}"
puts "является ли квадратом: #{rectangle.square?}"

puts 'Параметры параллелепипеда:'
puts "длина: #{rectangular_box.length}, ширина: #{rectangular_box.width}, высота: #{rectangular_box.height}"
puts "является ли квадратом: #{rectangular_box.square?}"
puts "тип параллелепипеда: #{rectangular_box.type}"
