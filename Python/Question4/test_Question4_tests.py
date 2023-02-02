import pytest
from Question4 import Question4

def test_create_object():
    instance_of_question4 = Question4()
    assert isinstance(instance_of_question4,Question4)

def test_all_positive_array():
    instance_of_question4=Question4()
    assert "Count = 2" == instance_of_question4.approach5([1, 2, 3, 4, 5],5)

def test_border_condition_check():
    instance_of_question4=Question4()
    assert "Count = 2" == instance_of_question4.approach5([10, 0, -10],0)

def test_all_zero():
    instance_of_question4=Question4()
    assert "Count = 6" == instance_of_question4.approach5([0, 0, 0],0)

def test_invlaid_k_value():
    instance_of_question4=Question4()
    assert "Count = 0" == instance_of_question4.approach5([10, 0, 5],2)

def test_negative_k_value():
    instance_of_question4=Question4()
    assert "Count = 0" == instance_of_question4.approach5([10, 0, 5],-2)

def test_string_k_value():
    instance_of_question4=Question4()
    assert "Not a valid value of k" == instance_of_question4.approach5([10, 0, 5],"ab")