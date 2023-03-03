@isTest
public class CalculatorAgainTest {
    @isTest
    private static void testMethod1() {
        CalculatorAgain c = new CalculatorAgain();
        c.publicMessage();
        c.welcomeMessage();
    }
    @isTest
    private static void testAdd1() {
        CalculatorAgain c = new CalculatorAgain();
        integer sum = c.add(5,10);
        system.assertEquals(15, sum);
    }
    @isTest 
    private static void testAdd2() {
        CalculatorAgain c = new CalculatorAgain();
        integer sum = c.add(5,10,10);
        system.assertEquals(25, sum) ;
    }
    @isTest 
    private static void testMethod2() {
        CalculatorAgain c = new CalculatorAgain();
        string rt = c.printAndReturnMessage('Hello message');
        system.assertEquals('Hello message...OK Cool', rt);
    }
}
