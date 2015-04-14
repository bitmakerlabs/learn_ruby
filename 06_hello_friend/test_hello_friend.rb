require './test_helper'
require 'friend'

class TestFriend < MiniTest::Test
  # 'setup' gets run before each individual test
  # We can set up variables that we reuse here
  def setup
    @friend = Friend.new
  end

  # greet
  def test_greets_someone
    assert_equal "Hello Bob!", @friend.greet("Bob")
  end

  def test_greets_no_one
    assert_equal "Hello !", @friend.greet

    # Hint: remember default values?
    #
    # def greet(name = ?)
    #   # your code here
    # end
    #
    # What should ? be equal to?
  end
end
