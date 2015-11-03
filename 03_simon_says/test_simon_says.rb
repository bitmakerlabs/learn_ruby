require './test_helper'
require 'simon_says'

# By now we should be getting better at reading tests. We should able to see
# what methods will need to be defined and what they need to return.

class TestSimonSays < MiniTest::Test
  def test_echo_hello
    assert_equal "hello", echo("hello")
  end

  def test_echo_bye
    assert_equal "bye", echo("bye")
  end

  # calling the method shout and passing in "hello"
  # should return "HELLO"
  def test_shout_hello
    assert_equal "HELLO", shout("hello")
  end

  def test_shout_multiple_words
    assert_equal "HELLO WORLD", shout("hello world")
  end

  def test_repeat
    assert_equal "hello hello", repeat("hello")
  end

  # Wait a second! How can you make the "repeat" method
  # take one *or* two arguments?
  #
  # def repeat(string, num = 1)
  #   # your code here
  # end
  #
  # The important part is num = 1. What happens is if a num isn't given,
  # then num will fallback on 1, i.e. it has a default value of 1.
  def test_repeat_multiple_times
    assert_equal "hello hello hello", repeat("hello", 3)
  end

  # start_of_word
  def test_start_of_word_returns_first_letter
    assert_equal "h", start_of_word("hello", 1)
  end

  def test_start_of_word_returns_first_two_letters
    assert_equal "Bo", start_of_word("Bob", 2)
  end

  def test_start_of_word_returns_first_many_letters
    s = "abcdefg"

    assert_equal "a", start_of_word(s, 1)
    assert_equal "ab", start_of_word(s, 2)
    assert_equal "abc", start_of_word(s, 3)
  end

  # first_word
  def test_first_word
    assert_equal "Hello", first_word("Hello World")
    assert_equal "oh", first_word("oh dear")
  end

  # titleize
  def test_titleize_capitalizes_a_word
    assert_equal "Jaws", titleize("jaws")
  end

  # capitalize every word
  def test_titleize_title_case
    assert_equal "David Copperfield", titleize("david copperfield")
  end

  def test_titleize_not_little_words
    assert_equal "War and Peace", titleize("war and peace")
  end

  def test_titleize_little_words_at_start
     assert_equal "The Bridge over the River Kwai", titleize("the bridge over the river kwai")
  end
end
