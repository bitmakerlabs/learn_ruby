require './test_helper'
require 'timer'

# Timer formats a given # of seconds
# into something you see on a stopwatch, i.e. 00:00:00 or 00:10:22

class TestTimer < MiniTest::Test
  # before each test create a new instance of the class Timer
  # and store it into the instance variable named @timer
  def setup
    @timer = Timer.new
  end

  def test_initialize_to_0_seconds
    assert_equal 0, @timer.seconds
  end

  # time_string
  def test_display_0
    @timer.seconds = 0
    assert_equal "00:00:00", @timer.time_string
  end

  def test_display_12
    @timer.seconds = 12
    assert_equal "00:00:12", @timer.time_string
  end

  def test_display_66
    @timer.seconds = 66
    assert_equal "00:01:06", @timer.time_string
  end

  def test_display_4000
    @timer.seconds = 4000
    assert_equal "01:06:40", @timer.time_string
  end


  # One way to implement the Timer is with a helper method.
  # This helper method would be called by time_string.
  # Uncomment these specs if you want to be tested for this helper method.
  #
  # padded
  # def test_pads_zero
  #    assert_equal '00', @timer.padded(0)
  # end

  # def test_pads_one
  #   assert_equal '01', @timer.padded(1)
  # end

  # def test_no_pad_with_two
  #   assert_equal '12', @timer.padded(12)
  # end
end
