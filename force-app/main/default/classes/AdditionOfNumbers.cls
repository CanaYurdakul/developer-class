public class AdditionOfNumbers {
    public static integer num1;
    public static integer num2;

    public AdditionOfNumbers(integer x, integer y) {
        num1= x ;
        num2= y ;
    }

    public static void calculation(){
        integer sum = num1 + num2;
        system.debug('Total of numbers ==> ' + sum);
    }
}