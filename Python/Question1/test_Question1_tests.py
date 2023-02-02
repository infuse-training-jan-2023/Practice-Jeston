import pytest
from Question1 import Question1
  
def test_create_object():
    instance_of_question1 = Question1("002-01.00-15.00")
    assert isinstance(instance_of_question1,Question1)

def test_serial_average_correct_string():
    instance_of_question1= Question1("002-01.00-15.00")
    assert "002-08.00" == instance_of_question1.serial_average()

def test_serial_average_correct_string_with_zeroes():
   instance_of_question1= Question1("002-00.00-00.00")
   assert "002-00.00" == instance_of_question1.serial_average()
  
def test_serial_average_correct_string_all_zeroes():
   instance_of_question1= Question1("000-00.00-00.00")
   assert "000-00.00" == instance_of_question1.serial_average()

def test_serial_average_incorrect_string_invalid_characters():
   instance_of_question1= Question1("XXX-02.00-00.00")
   assert "The given string contains invalid characters" == instance_of_question1.serial_average()

def test_serial_average_incorrect_string_invalid_characters_all_characters():
   instance_of_question1= Question1("XXX-aa.aa-ww.ww")
   assert "The given string contains invalid characters" == instance_of_question1.serial_average()

def test_serial_average_incorrect_string_invalid_syntax():
   instance_of_question1= Question1("0032-02.00-00.00")
   assert "The given string contains invalid characters" == instance_of_question1.serial_average()

def test_serial_average_incorrect_string_invalid_no_of_arguments():
   instance_of_question1= Question1("0032-02.00-00.00-02.00")
   assert "The given string contains invalid characters" == instance_of_question1.serial_average()

def test_serial_average_incorrect_string_invalid_no_of_arguments2():
   instance_of_question1= Question1("0032-02.00")
   assert "The given string contains invalid characters" == instance_of_question1.serial_average()
