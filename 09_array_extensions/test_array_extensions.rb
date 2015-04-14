require './test_helper'
require "array_extensions" # we don't call it "array.rb" since that would be confusing

class TestArray < MiniTest::Test
  # sum
  def test_has_sum_method
    assert_respond_to [], :sum
    assert_respond_to Array, :sum

    # [] and Array are synonymous
    #
    # Whoa! Hold on! We're assert_equaled to add a method
    # to a class that already exists inside of Ruby?
    # Well, yes. And the way you can do that is quite easy:
    #
    # class Array
    #   def hello
    #     return "Hello!"
    #   end
    # end
    #
    # [].hello => "Hello!"
  end

  def test_return_0_for_empty_array
    assert_equal 0, [].sum
  end

  def test_sum_array_elements
    assert_equal 7, [1,2,4].sum
  end

  # square
  def test_returns_empty_when_empty
    assert_equal [], [].square
  end

  def test_returns_new_array_with_squares
    assert_equal [1,4,9], [1,2,3].square
  end

  # square!
  def test_squares_original_array
    array = [1,2,3]
    array.square!
    assert_equal [1,4,9], array
  end
end
