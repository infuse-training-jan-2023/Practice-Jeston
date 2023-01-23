import java.util.Scanner;

public class Calculator {
	//Method for addition
	static int add(int num1, int num2){
		int result = num1+num2;
		return result;
	}

    //Method for subtraction
	static int substract(int num1, int num2){
		int result = num1-num2;
		return result;
	}
    //Method for multiplication
	static int multiply(int num1, int num2){
		int result = num1*num2;
		return result;
	}

   

   public static void main(String[] args) {

      // Declare variables
      int num1=0, num2=0;
      char operator='\0';

      // create Scanner class object to  
      // read inputs
      Scanner scan = new Scanner(System.in);
      System.out.print("Enter two numbers: ");
      num1 = scan.nextInt();
      num2 = scan.nextInt();

      // read operator
      System.out.println("Available Operators"
		+ "are::  (+ - * / % ^)");
      System.out.print("Enter operator: ");
      operator = scan.next().charAt(0);

      // switch-case statements
      switch(operator) {

         case '+':
            System.out.println("Result = "+ add(num1,num2));
		break;

	 case '-':
             System.out.println("Result = "+ substract(num1,num2));
            
		break;

	 case '*':
     System.out.println("Result = "+ multiply(num1,num2));
		break;

	 case '/':
		break;

	 default:
	    System.out.println("Invalid operator");
      } // end of switch-case

       
      // close Scanner class object
      scan.close();

   } 