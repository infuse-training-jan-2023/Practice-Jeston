require 'test/unit'
require_relative 'program'

class Tests < Test::Unit::TestCase
  @@arr = [2, 6, 7, 8, 3, 1]

  def test_create_object
    instance_of_question2 = Question2.new
    assert instance_of_question2.instance_of? Question2
  end

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

  def test_element_at_negative2
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('The given index is invalid', instance_of_question2.element_at(arr, -98))
  end

  def test_element_at_negative3
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('The given index is invalid', instance_of_question2.element_at(arr, -98))
  end

  def test_inclusive_range_positive
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('[2, 6, 7]', instance_of_question2.inclusive_range(arr, 0, 2))
  end

  def test_inclusive_range_positive2
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('[8, 3, 1]', instance_of_question2.inclusive_range(arr, 3, 5))
  end

  def test_inclusive_range_negative
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('The given indexes are not valid', instance_of_question2.inclusive_range(arr, 3, 8))
  end

  def test_inclusive_range_negative2
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('The end position cannot be lesser than the start position', instance_of_question2.inclusive_range(arr, 8, 3))
  end

  def test_inclusive_range_negative3
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('The end position cannot be lesser than the start position', instance_of_question2.inclusive_range(arr, 3, -1))
  end

  def test_non_inclusive_range_positive1
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('[6, 7, 8]', instance_of_question2.non_inclusive_range(arr, 1, 4))
  end

  def test_non_inclusive_range_positive2
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('[2, 6, 7, 8, 3]', instance_of_question2.non_inclusive_range(arr, 0, 5))
  end

  def test_non_inclusive_range_negative
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('The given indexes are not valid', instance_of_question2.non_inclusive_range(arr, 0, 8))
  end

  def test_non_inclusive_range_negative2
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('The end position cannot be lesser than the start position', instance_of_question2.non_inclusive_range(arr, 8, 0))
  end

  def test_start_and_length
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('[2, 6]', instance_of_question2.start_and_length(arr, 0, 2))
  end

  def test_start_and_length_negative
    arr = [2, 6, 7, 8, 3, 1]
    instance_of_question2 = Question2.new
    assert_equal('Array index out of bounds', instance_of_question2.start_and_length(arr, 5, 2))
  end
end