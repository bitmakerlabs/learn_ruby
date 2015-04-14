require './test_helper'
require 'bowling'

class TestGame < MiniTest::Test
  def setup
    @game = Game.new
  end

  def test_score_300_for_perfect_game
    score = 12.times.map { 10 }
    assert_equal 300, @game.score(score)
  end

  def test_score_0_for_gutter_game
    score = 12.times.map { 0 }
    assert_equal 0, @game.score(score)
  end

  def test_score_20_for_all_1_game
    score = 20.times.map { 1 }
    assert_equal 20, @game.score(score)
  end

  def test_score_20_when_5_is_after_a_spare
    score = [5,5,5] + 17.times.map { 0 }
    assert_equal 20, @game.score(score)
  end

  def test_score_24_when_strike_is_followed_by_3_and_4
    score = [10,3,4] + 17.times.map { 0 }
    assert_equal 24, @game.score(score)
  end

  def test_score_10_when_strike_is_followed_by_gutters
    score = [10] + 19.times.map { 0 }
    assert_equal @game.score(score)
  end

  def test_score_20_when_gutter_followed_by_10_and_5
    score = [0,10,5] + 17.times.map { 0 }
    assert_equal 20, @game.score(score)
  end

  def test_score_150_for_all_5
    score = 21.times.map { 5 }
    assert_equal 150, @game.score(score)
  end
end
