# frozen_string_literal: true

require 'faker'
require 'minitest/autorun'
require './main.rb'

class TestCypher < Minitest::Test
  def test_encrypts
    string, expected, key = string_pair
    assert_equal expected, encrypt(string, key)
  end

  def test_decrypts
    expected, string, key = string_pair
    assert_equal expected, decrypt(string, key)
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
                        .map { |char, shift| [char, BASE_SHIFT + (char - BASE_SHIFT + shift) % ALPHABET_BASE] }
                        .transpose
    [string.pack('U*'), encrypted.pack('U*'), key]
  end

  def encryption_key
    Faker::Number.between(from: 132, to: 548).to_s
  end
end
