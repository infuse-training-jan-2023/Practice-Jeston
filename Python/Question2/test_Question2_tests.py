import pytest
from Question2 import Question2

arr = [2, 6, 7, 8, 3, 1]

def test_create_object():
    instance_of_question2 = Question2()
    assert isinstance(instance_of_question2,Question2)

def test_element_at_position_positive():
    instance_of_question2 = Question2()    
    assert 3==instance_of_question2.element_at(arr, 4)

def test_element_at_position_invalid():
    instance_of_question2 = Question2()
    assert 'The given index is invalid'== instance_of_question2.element_at(arr, 9)

def test_element_at_position_negative():
    instance_of_question2 = Question2()
    assert 'The given index is invalid' == instance_of_question2.element_at(arr, -98)

def test_inclusive_range_positive_with_zero():
    instance_of_question2 = Question2()
    assert [2, 6, 7] == instance_of_question2.inclusive_range(arr, 0, 2)

def test_inclusive_range_positive():
     instance_of_question2 = Question2()
     assert  [8, 3, 1] == instance_of_question2.inclusive_range(arr, 3, 5)

def test_inclusive_range_invalid_index():
    instance_of_question2 = Question2()
    assert 'The given indexes are not valid'== instance_of_question2.inclusive_range(arr, 3, 8)

def test_inclusive_range_negative():
    instance_of_question2 = Question2()
    assert 'The end position cannot be lesser than the start position'== instance_of_question2.inclusive_range(arr, 8, 3)

def test_inclusive_range_negative_index():
   instance_of_question2 = Question2()
   assert 'The end position cannot be lesser than the start position'== instance_of_question2.inclusive_range(arr, 3, -1)

def test_non_inclusive_range_positive():
    instance_of_question2 = Question2()
    assert [6, 7, 8] == instance_of_question2.non_inclusive_range(arr, 1, 4)

def test_non_inclusive_range_positive_with_zero():
    instance_of_question2 = Question2()
    assert [2, 6, 7, 8, 3] == instance_of_question2.non_inclusive_range(arr, 0, 5)


def test_non_inclusive_range_negative_invalid_index():
    instance_of_question2 = Question2()
    assert 'The given indexes are not valid'== instance_of_question2.non_inclusive_range(arr, 0, 8)


def test_non_inclusive_range_negative():
    instance_of_question2 = Question2()
    assert 'The end position cannot be lesser than the start position'== instance_of_question2.non_inclusive_range(arr, 8, 0)


def test_start_and_length_positive():
    instance_of_question2 = Question2()
    assert [2, 6]== instance_of_question2.start_and_length(arr, 0, 2)

  
def test_start_and_length_negative():
    instance_of_question2 = Question2()
    assert 'Array index out of bounds'== instance_of_question2.start_and_length(arr, 5, 2)
