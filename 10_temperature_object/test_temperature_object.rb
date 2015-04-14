require './test_helper'
require 'temperature'

# Note: This is the last problem, and it is quite hard!
# Take your time, don't be scared to ask for help–
# we're pushing your limits, if you can do it you'll be in an amazing position moving forward.

# Remember one degree fahrenheit is 5/9 of one degree celsius,
# and the freezing point of water is 0 degrees celsius but 32 degrees fahrenheit.

class TestTemperature < MiniTest::Test
  # constructing with options hash with F
  # to_fahrenheit

  def test_initialize_fahrenheit
    assert_equal 50, Temperature.new({:f => 50}).to_fahrenheit

    # A hash with the key "f" is being passed in.

    # Remember, new is synonymous with initialize.
    # An example might help:
    #
    # class Person
    #   def initialize(name)
    #     @name = name
    #   end
    # end
    #
    # Person.new("Alex")
  end

  # conversions
  def test_convert_celsius_at_freezing
    assert_equal 0, Temperature.new({:f => 32}).to_celsius
  end

  def test_convert_celsius_at_boiling
    assert_equal 100, Temperature.new({:f => 212}).to_celsius
  end

  def test_convert_celsius_at_body_temperature
    assert_equal 37, Temperature.new({:f => 98.6}).to_celsius
  end

  def test_convert_celsius_at_any_temperature
    assert_equal 20, Temperature.new({:f => 68}).to_celsius
  end

  # constructing with options hash with F
  # to_fahrenheit
  def test_initialize_celsius
    assert_equal 50, Temperature.new({:c => 50}).to_celsius
  end

  def test_convert_fahrenheit_at_freezing
    assert_equal 32, Temperature.new({:c => 0}).to_fahrenheit
  end

  def test_convert_fahrenheit_at_boiling
    assert_equal 212, Temperature.new({:c => 100}).to_fahrenheit
  end

  # constructing factory methods

  def test_in_celsius
    assert_equal 50, Temperature.in_celsius(50).to_celsius
    assert_equal 12, Temperature.in_celsius(50).to_fahrenheit

    # Nothing different is being achieved with these two lines,
    # they're just a different way of doing the same thing,
    # that requires you to write your code another way.
    #
    # Remember, methods called on a class are called class methods.
    # Here's an example:
    #
    # class Person
    #   def self.what_am_i
    #     return "I am a person."
    #   end
    # end
    #
    # Person.what_am_i # => "I am a person."
  end

  def test_in_fahrenheit
    assert_equal 50, Temperature.in_fahrenheit(50).to_fahrenheit
    assert_equal 10, Temperature.in_fahrenheit(50).to_celsius
  end

  #  Temperature subclasses
  def test_celsius_subclass_initialize
    assert_equal 50, Celsius.new(50).to_celsius
    assert_equal 122, Celsius.new(50).to_fahrenheit

    # Again, this is a different way of doing the same thing.
    # Instead of initializing a new Temperature with a hash that has a key "c",
    # we're just initializing a new Celsius.
  end

  def test_celsius_is_temperature_subclass
    # In other words, Celsius *inherits* from Temperature.
    assert_equal Temperature, Celsius.superclass
    # Remember class inheritance?
    #
    # class Person < Mammal
    # end
  end

  def test_fahrenheit_subclass_initialize
    assert_equal 50, Fahrenheit.new(50).to_fahrenheit
    assert_equal 10, Fahrenheit.new(50).to_celsius
  end

  def test_fahrenheit_is_temperature_subclass
    assert_equal Temperature, Fahrenheit.superclass
  end


  # Extra credit:
  #
  # 1. Fill in the tests below, so that they test for two class methods – ftoc and ctof
  # 2. Refactor the rest of your code so it calls these two methods when appropriate

  # utility class methods

  # def test_.....
end

# There are two extra credit problems also available
# The folders for them are called bonus_dictionary and bonus_rpn_dictionary

# There are also two other stretch assignments
# stretch_make_change
# stretch_bowling
