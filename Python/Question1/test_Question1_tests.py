import pytest
from Question1 import Question1
  
instance_of_question1= Question1()

def test_create_object():
    assert isinstance(instance_of_question1,Question1)

def test_serial_average_correct_string():
    assert "002-08.00" == instance_of_question1.serial_average("002-01.00-15.00")

def test_serial_average_correct_string_with_zeroes():
   assert "002-00.00" == instance_of_question1.serial_average("002-00.00-00.00")
  
def test_serial_average_correct_string_all_zeroes():
   assert "000-00.00" == instance_of_question1.serial_average("000-00.00-00.00")

def test_serial_average_incorrect_string_invalid_characters():
   assert "The given string contains invalid characters" == instance_of_question1.serial_average("XXX-02.00-00.00")

def test_serial_average_incorrect_string_invalid_characters_all_characters():
   assert "The given string contains invalid characters" == instance_of_question1.serial_average("XXX-aa.aa-ww.ww")

def test_serial_average_incorrect_string_invalid_syntax():
   assert "The given string contains invalid characters" == instance_of_question1.serial_average("0032-02.00-00.00")

def test_serial_average_incorrect_string_invalid_no_of_arguments():
   assert "The given string contains invalid characters" == instance_of_question1.serial_average("0032-02.00-00.00-02.00")

def test_serial_average_incorrect_string_invalid_no_of_arguments2():
   assert "The given string contains invalid characters" == instance_of_question1.serial_average("0032-02.00")
