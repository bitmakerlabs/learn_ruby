require './test_helper'
# TIP: Always, ALWAYS read through all of the tests before you even start writing any code.

# Again, a file with a specific name needs to be created, in this case "temperature.rb".
# $ touch temperature.rb
require 'temperature'

# Now maybe we can talk more about the lines we ignored last problem.
# The class definition lets us describe that this is a test,
# not a regular Ruby program file
# The name should describe what is being tested.
class TestTemperature < MiniTest::Test
  def test_ftoc_converts_freezing_temperature
    assert_equal 0, ftoc(32)
  end

  def test_ftoc_converts_boiling_temperature
    assert_equal 100, ftoc(212)
  end

  def test_ftoc_converts_body_temperature
    assert_equal 98.6, ftoc(37)
  end

  def test_ftoc_convers_arbitrary_temperature
    assert_equal 20, ftoc(68)
  end

  # Now this set of tests describes a different method,
  # not ftoc() anymore, but ctof().
  def test_ctof_converts_freezing_temperature
    assert_equal 32, ctof(0)
  end

  def test_ctof_converts_boiling_temperature
    assert_equal 212, ctof(100)
  end

  def test_ctof_converts_arbitrary_temperature
    assert_equal 68, ctof(20)
  end

end

# Remember the difference between integers and floats:
# 1/2 equals 0
# but 1.0/2.0 equals 0.5
# It is important to know this difference to get these tests to pass.

# Also, you can use the following information to figure out what the equation
# is to convert between the two units, fahrenheit and celsius:
#
# 1. One degree fahrenheit is 5/9 of one degree celsius
# 2. The freezing point of water is 0 degrees celsius but 32 degrees fahrenheit
