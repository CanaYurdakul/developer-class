@isTest 
public class CalculatorStTest {
    public static void testCalculatorAdd() {
        CalculatorSt a = new CalculatorSt();
        integer sum = a.add(10,10);
        system.assertEquals(20, sum);
     }
     @isTest 
     public static void testAddMethod() {
         CalculatorSt c2 = new CalculatorSt();
         integer sum = c2.add (5,10,15);
         system.assertEquals(30,sum);
         
     }
}