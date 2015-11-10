require './test_helper'
require 'rpn_@calculator'

# "RPN" stands for "Reverse Polish Notation".
# (See the wikipedia entry: http://en.wikipedia.org/wiki/Reverse_Polish_notation)
# Briefly, in an RPN world, instead of using normal "infix" notation, e.g.
#
#     2 + 2
#
# you use "postfix" notation, e.g.
#
#     2 2 +
#
# While this may seem bizarre, there are some advantages to doing things this way.
# For one, you never need to use parentheses, since there is never any ambiguity
# as to what order to perform operations in. The rule is, you always go from the back,
# or the left side.
#
#     1 + 2 * 3 =>
#     (1 + 2) * 3 or
#     1 + (2 * 3)
#
#     1 2 + 3 * => (1 + 2) * 3
#     1 2 3 * + => 1 + (2 * 3)
#
# Another advantage is that you can represent any mathematical formula
# using a simple and elegant data structure, called a stack
# (http://en.wikipedia.org/wiki/Stack_(data_structure)).
#
# Hint:
#
# Ruby doesn't have a built-in stack, but the standard Array
# has all the methods you need to emulate one (namely, `push` and `pop`, and optionally `size`).

class TestRPNCalculator < MiniTest::Test
  def setup
    @calculator = RPNCalculator.new
  end

  def test_add_two_numbers
    @calculator.push(2)
    @calculator.push(3)
    @calculator.plus
    assert_equal 5, @calculator.value
  end

  def test_add_three_numbers
    @calculator.push(2)
    @calculator.push(3)
    @calculator.push(4)
    @calculator.plus
    assert_equal 7, @calculator.value
    @calculator.plus
    assert_equal 9, @calculator.value
  end

  def test_subtracts
    @calculator.push(2)
    @calculator.push(3)
    @calculator.minus
    assert_equal (-1), @calculator.value
  end

  def test_add_and_subtract
    @calculator.push(2)
    @calculator.push(3)
    @calculator.push(4)
    @calculator.minus
    assert_equal (-1), @calculator.value
    @calculator.plus
    assert_equal 1, @calculator.value
  end

  def test_multiply_and_divide
    @calculator.push(2)
    @calculator.push(3)
    @calculator.push(4)
    @calculator.divide
    assert_equal (3.0 / 4.0), @calculator.value
    @calculator.times
    assert_equal 2.0 * (3.0 / 4.0), @calculator.value
  end

  def test_resolve_operator_precedence
    # 1 2 + 3 * => (1 + 2) * 3
    @calculator.push(1)
    @calculator.push(2)
    @calculator.plus
    @calculator.push(3)
    @calculator.times
    assert_equal (1+2)*3, @calculator.value

    # 1 2 3 * + => 1 + (2 * 3)
    @calculator.push(1)
    @calculator.push(2)
    @calculator.push(3)
    @calculator.times
    @calculator.plus
    assert_equal 1+(2*3), @calculator.value
  end

  def test_errors_with_insufficient_numbers
    assert_raises "calculator is empty" do
      @calculator.plus
    end

    assert_raises "calculator is empty" do
      @calculator.minus
    end

    assert_raises "calculator is empty" do
      @calculator.times
    end

    assert_raises "calculator is empty" do
      @calculator.divide
    end
  end

  # Extra Credit:
  def test_tokenize_a_string
    assert_equal [1, 2, 3, :*, :+, 4, 5, :-, :/], @calculator.tokens("1 2 3 * + 4 5 - /")
  end

  # Extra Credit:
  def test_evaluate_string
    assert_equal (2 * 3) + 1, @calculator.evaluate("1 2 3 * +")
    assert_equal (4 - 5), @calculator.evaluate("4 5 -")
    assert_equal (2.0 / 3.0), @calculator.evaluate("2 3 /")
    assert_equal (1.0 + (2 * 3)) / (4 - 5), @calculator.evaluate("1 2 3 * + 4 5 - /")
  end
end
