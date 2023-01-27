require 'test/unit'
require_relative 'Question1'

class Tests < Test::Unit::TestCase
  
  def test_create_object()
    instance_of_question1 = Question1.new()
    assert instance_of_question1.instance_of? Question1
  end

  def test_serial_average_correct_string()
    instance_of_question1= Question1.new()
    assert_equal("002-08.00",instance_of_question1.serial_average("002-01.00-15.00"))
  end

  def test_serial_average_correct_string2()
    instance_of_question1= Question1.new()
    assert_equal("002-15.00",instance_of_question1.serial_average("002-10.00-20.00"))
  end

  def test_serial_average_correct_string3()
    instance_of_question1= Question1.new()
    assert_equal("002-09.50",instance_of_question1.serial_average("002-10.00-09.00"))
  end
  
  def test_serial_average_correct_string4()
    instance_of_question1= Question1.new()
    assert_equal("002-00.00",instance_of_question1.serial_average("002-00.00-00.00"))
  end

 def test_serial_average_incorrect_string()
    instance_of_question1= Question1.new()
    assert_equal("invalid syntax of string ",instance_of_question1.serial_average('002'))
  end

  def test_serial_average_incorrect_string_input()
    instance_of_question1= Question1.new()
    assert_equal("invalid syntax of string ",instance_of_question1.serial_average("anis"))
  end

  def test_serial_average_incorrect_string_numbers()
    instance_of_question1= Question1.new()
    assert_equal("invalid syntax of string ",instance_of_question1.serial_average(01000))
  end

  def test_serial_average_incorrect_string_arguments()
    instance_of_question1= Question1.new()
    assert_equal("Invalid number of arguments in string",instance_of_question1.serial_average("002-00.00-00.00-09.00"))
  end

  
  # def test_serial_average_incorrect_alphabetic_input()
  #   instance_of_question1= Question1.new()
  #   assert_equal("Invalid number of arguments in string",instance_of_question1.serial_average("aaa-aa.aa-aa.aa"))
  # end
  
end