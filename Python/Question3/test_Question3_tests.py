import pytest
from Question3 import Question3

array = ['Cricket', 'TT' ,'Football' ,'Hockey']

def test_create_object():
    instance_of_question3 = Question3()
    assert isinstance(instance_of_question3,Question3)

def test_positive():
    instance_of_question3 = Question3()
    assert ['2 : Football', '3 : Hockey'] == instance_of_question3.skip_sports(array, 2)

def test_positive_all_elements():
    instance_of_question3 = Question3()
    assert ['0 : Cricket','1 : TT','2 : Football', '3 : Hockey'] == instance_of_question3.skip_sports(array, 0)

def test_invalid_index():
    instance_of_question3 = Question3()
    assert "The array size/index is not of valid" == instance_of_question3.skip_sports(array, 8)

def test_negative_index():
    instance_of_question3 = Question3()
    assert "The array size/index is not of valid" ==  instance_of_question3.skip_sports(array,-2)
