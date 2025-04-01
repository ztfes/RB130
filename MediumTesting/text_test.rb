require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sampletext.txt', 'r')
    @textfile = Text.new(@file.read)
  end

  def test_swap
    assert_includes(@textfile.swap("a","b"), "b") # possibly redundant, but verifies the modified text does include the swapped-in character
    refute_includes(@textfile.swap("a","b"), "a")
  end

  def test_word_count
    assert_equal(72 @textfile.word_count)
  end

  def teardown
    @file.close  
  end
end