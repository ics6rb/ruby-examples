# frozen_string_literal: true

require 'faker'
require 'minitest/autorun'
require './main'

class TestCypher < Minitest::Test
  def test_encrypts
    string, expected, key = string_pair
    assert_equal expected, encrypt(string, key)
  end

  def test_encrypts_example
    assert_equal 'Тйтой фдррло ер тсг', encrypt('Пирог сгорел до тла', '31206')
  end

  def test_decrypts
    expected, string, key = string_pair
    assert_equal expected, decrypt(string, key)
  end

  def test_decrypts_example
    assert_equal 'Пирог сгорел до тла', decrypt('Тйтой фдррло ер тсг', '31206')
  end

  private

  ALPHABET = ('А'..'я').to_a

  def word(num_letters = 6)
    ALPHABET.sample num_letters
  end

  def sentence(num_words = 4)
    num_words.times.map { word }.join
  end

  def string_pair
    key = encryption_key
    string, encrypted = sentence
                        .unpack('U*')
                        .zip(key.each_char.map(&:to_i).cycle)
                        .map { |char, shift| [char, BASE_SHIFT + (char - BASE_SHIFT + shift) % ALPHABET_SIZE] }
                        .transpose
    [string.pack('U*'), encrypted.pack('U*'), key]
  end

  def encryption_key
    Faker::Number.between(from: 132, to: 548).to_s
  end
end
