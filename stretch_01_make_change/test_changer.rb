require './test_helper'
require 'changer'

class TestChanger < MiniTest::Test

  # make_change
  def test_change_one_quarter
    assert_equal [25], Changer.make_change(25)
  end

  def test_change_multiple_quarters
    assert_equal [25, 25], Changer.make_change(50)
  end

  def test_change_one_dime
    assert_equal [10], Changer.make_change(10)
  end

  def test_change_mutiple_dimes
    assert_equal [10, 10], Changer.make_change(20)
  end

  def test_change_small_complex_amount
    assert_equal [5, 1, 1], Changer.make_change(7)
  end

  def test_change_large_complex_amount
    assert_equal [25, 25, 10, 5, 1, 1, 1], Changer.make_change(68)
  end
end
