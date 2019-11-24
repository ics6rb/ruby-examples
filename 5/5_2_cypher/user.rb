# frozen_string_literal: true

require './main.rb'

puts 'Введите ключ'

key = gets.chomp

unless /^\d+$/ =~ key
  puts 'Ключ может состоять только из цифр'
  exit 1
end

puts 'Вводите строки по одной, окончание ввода по пустой строке.'

strings = []

ARGF.each_line do |line|
  line.chomp!

  break if ARGF.lineno > 1 && line == ''

  strings << line
end

unless strings.reject(&:empty?).reject { |string| /^[А-Яа-я\s]+$/ =~ string }.empty?
  puts 'Программа работает только со строками на русском языке'
  exit 1
end

encrypted = strings.map { |string| encrypt string, key }
decrypted = encrypted.map { |string| decrypt string, key }

puts 'Зашифрованные строки'

print_strings encrypted

puts 'Расшифрованные строки'

print_strings decrypted
