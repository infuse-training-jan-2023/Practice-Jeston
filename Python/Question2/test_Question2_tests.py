import pytest
from Question2 import Question2

arr = [2, 6, 7, 8, 3, 1]
instance_of_question2 = Question2()

def test_create_object():
    
    assert isinstance(instance_of_question2,Question2)

def test_element_at_position_positive():    
    assert 3==instance_of_question2.element_at(arr, 4)

def test_element_at_position_invalid():
    with pytest.raises(IndexError):
        instance_of_question2.element_at(arr, 9)

def test_element_at_position_negative():
    with pytest.raises(IndexError):
        instance_of_question2.element_at(arr, -98)

def test_inclusive_range_positive_with_zero():
    assert [2, 6, 7] == instance_of_question2.inclusive_range(arr, 0, 2)

def test_inclusive_range_positive():

     assert  [8, 3, 1] == instance_of_question2.inclusive_range(arr, 3, 5)

def test_inclusive_range_invalid_index():
    assert 'The given array is not of valid size'== instance_of_question2.inclusive_range(arr, 3, 8)

def test_inclusive_range_negative():
    assert 'The given array is not of valid size'== instance_of_question2.inclusive_range(arr, 8, 3)

def test_inclusive_range_negative_index():
   assert 'The given array is not of valid size'== instance_of_question2.inclusive_range(arr, 3, -1)

def test_non_inclusive_range_positive():
    assert [6, 7, 8] == instance_of_question2.non_inclusive_range(arr, 1, 4)

def test_non_inclusive_range_positive_with_zero():
    assert [2, 6, 7, 8, 3] == instance_of_question2.non_inclusive_range(arr, 0, 5)


def test_non_inclusive_range_negative_invalid_index():
    assert 'The given array is not of valid size'== instance_of_question2.non_inclusive_range(arr, 0, 8)


def test_non_inclusive_range_negative():
    assert 'The given array is not of valid size'== instance_of_question2.non_inclusive_range(arr, 8, 0)


def test_start_and_length_positive():
    assert [2, 6]== instance_of_question2.start_and_length(arr, 0, 2)

  
def test_start_and_length_negative():
    with pytest.raises(IndexError):
        instance_of_question2.start_and_length(arr, 5, 2)
