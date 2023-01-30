require 'test/unit'
require_relative 'Question2'

class Tests < Test::Unit::TestCase
  @@arr = [2, 6, 7, 8, 3, 1]

  def test_element_at_positive
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal(3, instance_of_question2.element_at(arr, 4))
  end

  def test_element_at_negative
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('The given index is invalid', instance_of_question2.element_at(arr, 9))
  end
end