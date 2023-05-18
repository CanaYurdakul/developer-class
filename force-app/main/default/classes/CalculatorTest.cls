@isTest
public class CalculatorTest {
    @isTest 
    private static void testCalculatorAdd() {
       Calculator c = new Calculator();
       integer sum = c.add(5,10);
       system.assertEquals(15, sum);
    }
    @isTest 
    private static void testAddMethod() {
        Calculator c2 = new Calculator();
        integer sum = c2.add(5,10,15);
        system.assertEquals(30,sum);
        
    }
}