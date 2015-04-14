require './test_helper'
require 'silly_blocks'

class TestSillyBlocks < MiniTest::Test
  # reverser

  def test_reverses_string_returned_by_block
    result = reverser do
      "hello"
    end

    assert_equal "olleh", result

    # You might be tempted to ask yourself what the hell is happening here.
    # Well no worries! Superman is here to the rescue!
    # (Heh, you probably don't even know whose written these comments.)
    #
    # Let's look at this snippet of code in particular:
    #
    # reverser do
    #   "hello"
    # end
    #
    # reverser is still a method, and it should return the reverse of the given string, i.e. "olleh",
    # except the string is not being passed in as a parameter. It's being passed in as a do-end block.
    # The way this method can get that do-end block is through yield.
    #
    # def example
    #   string = yield # yield is equal to...
    #   string.upcase
    # end
    #
    # example do
    #   "My name is Will Richman." # ...this line
    # end
    #
    # So to get this test to pass the reverser method would look like:
    #
    # def reverser
    #   yield.reverse
    # end
  end

  # Now, edit the reverser method above to get this test to pass
  def test_reverses_each_word_returned_by_block

    result = reverser do
        "hello dolly"
      end
    assert_equal "olleh yllod", result
  end

  # adder

  def test_adds_one_to_value_returned_by_block
    result = adder do
      5
    end

    assert_equal 6, result

    # def adder
    #   num = yield
    #   # what do you want do you with num?
    # end
  end

  def test_adds_3_to_value_returned_by_block
    result = adder(3) do
      5
    end

    assert_equal 8, result
  end

  # repeater
  def test_executes_the_block
    n = 2
    repeater do
      n += 3
    end

    assert_equal 5, n
  end

  def test_executes_block_3_times
    n = 0
    repeater(3) do
      n += 1
    end

    assert_equal 3, n
  end

  def test_executes_block_10_times
    n = 0
    repeater(10) do
      n += 1
    end

    assert_equal 10, n
  end
end
