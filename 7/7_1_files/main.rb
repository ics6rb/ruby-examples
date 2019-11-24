# frozen_string_literal: true

require 'faker'

def generate_file(file_name, num_sentences = 10)
  File.open(file_name, 'w') do |file|
    num_sentences.times { file.puts Faker::Lorem.sentence }
  end
end

def replace_capital_letters(src_file_name, dest_file_name)
  raise ArgumentError, "Файл #{src_file_name} не существует." unless File.exist?(src_file_name)

  File.open(dest_file_name, 'w') do |dest|
    File.open(src_file_name) do |src|
      dest.write src.read.downcase
    end
  end
end
