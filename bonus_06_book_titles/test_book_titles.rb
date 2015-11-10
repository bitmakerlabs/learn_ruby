require './test_helper'
require 'book'

class TestBook < MiniTest::Test
  # Before every test...
  def setup
    # do this
    @book = Book.new
  end

  # title
  def test_capitalize_first_letter
    # @book is a variable that was defined in the setup method
    @book.title = "inferno"
    assert_equal "Inferno", @book.title

    # Another way of saying these two lines is after we set the title of the book, when we get its title
    # it should be capitalized properly.
    # We set the title of the book with @book.title = "inferno"
    # and we get the title of the book wtih @book.title
    #
    # To be able to do @book.title = "inferno",
    # when we define the method title it has to look like this:
    #
    # def title=(string)
    #   # your code here
    # end
    #
    # The important part is that equal signs after title in the method name.
    # It lets us do @book.title = "inferno", versus @book.title("inferno") when we have the method
    #
    # def title(string)
    #   # your code here
    # end
    #
    # (i.e. w/o the equals sign)
  end

  def test_capitalize_every_word
    @book.title = "stuart little"
    assert_equal "Stuart Little", @book.title
  end

  def test_capitalize_words_except_the
    @book.title = "alexander the great"
    assert_equal "Alexander the Great", @book.title
  end

  def test_capitalize_words_except_a
    @book.title = "to kill a mockingbird"
    assert_equal "To Kill a Mockingbird", @book.title
  end

  def test_capitalize_words_except_an
    @book.title = "to eat an apple a day"
    assert_equal "To Eat an Apple a Day", @book.title
  end

  def test_capitalize_words_except_conjunctions
    @book.title = "war and peace"
    assert_equal "War and Peace", @book.title
  end

  def test_capitalize_words_except_prepositions
    @book.title = "love in the time of cholera"
    assert_equal "Love in the Time of Cholera", @book.title
  end

  def test_capitalize_i
    @book.title = "what i wish i knew when i was 20"
    assert_equal "What I Wish I Knew When I Was 20", @book.title
  end

  def test_capitalize_first_word
    @book.title = "the man in the iron mask"
    assert_equal "The Man in the Iron Mask", @book.title
  end
end
