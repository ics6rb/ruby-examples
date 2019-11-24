# frozen_string_literal: true

# Работаем только с русским алфавитом.
ALPHABET_BASE = ('А'..'я').to_a.size
# Код первой буквы алфавита, чтобы можно было сделать циклическую сумму.
BASE_SHIFT = 'А'.ord

def print_strings(strings)
  strings.each do |string|
    puts string
  end
end

def generate_key_for_string(string, key)
  key_cycle = key.each_char.map(&:to_i).cycle
  string.each_char.map { |char| (key_cycle.next if /[А-Яа-я]/ =~ char) || 0 }
end

def apply_key_to_string(string, key, &operation)
  key_for_string = generate_key_for_string(string, key)
  string
    .unpack('U*')
    .map { |char_code| (char_code - BASE_SHIFT).abs }
    .zip(key_for_string)
    .map { |char_code, shift| operation.call(char_code, shift) % ALPHABET_BASE }
    .map { |char_code| char_code + BASE_SHIFT }
    .pack('U*')
end

def encrypt(string, key)
  apply_key_to_string(string, key) { |char_code, shift| char_code + shift }
end

def decrypt(string, key)
  apply_key_to_string(string, key) { |char_code, shift| char_code - shift }
end
