require './test_helper'
# You should be in the folder 00_hello on the command line,
# you should have already entered
# and you should be running this problem's tests by entering
# $ rake

# The first time you run the tests, you should get an error saying "cannot load such file -- hello.rb (LoadError)"
# That error is coming from the line below (line #10)–
# it means get a file with the name "hello.rb" in the current directory.
require "hello"
# To stop this error from being thrown we need to create the file:
# $ touch hello.rb

# Now if we run rake again, it will complain about "a undefined local variable or method `hello'"
# Let's keep this in mind while we go through the next little bit of code.

# The line below is not important to us (line #18)
class TestHello < MiniTest::Test
  # neither is #20,
  def test_says_hello
    # but this is the important part.
    # Line #24 is saying: if we call the method hello, what it returns should be equal to "Hello!"
    # If that's not the case, this is a failing test.
    assert_equal("hello", hello)
    # So in hello.rb let's define a method named hello,
    # and let's make it return "Hello!"

    # In hello.rb:
    #
    # def hello
    #   "Hello!"
    # end
  end

# Congrats, if all went well, we made our first test ever pass!

# But hold on there cowboy, we got another test right in front of us now.

  def test_says_hello_to_someone
    assert_equal "Hello, Alice!", greet("Alice")
  end

  def test_says_hello_to_someone_else
    assert_equal "Hello, Bob!", greet("Bob")
  end

  # These two tests are saying there should be a method named greet
  # that takes in a string, and returns that string inside of another string, a hello greeting.
  # Again, the method has to be defined in hello.rb
  # Try see if you can get this test to pass!
end
