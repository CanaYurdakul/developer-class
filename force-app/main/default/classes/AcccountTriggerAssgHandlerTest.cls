@isTest 
public class AcccountTriggerAssgHandlerTest {
    @isTest 
    private static void testAccountUpdate() {
        Account acc = new account();
        acc.Name = 'test 1';
        acc.Industry = 'Energy';
        acc.Description = 'Account is Active';

        Account acc2 = new account();
        acc2.Name = 'test 2';
        acc2.Industry = 'Energy';
        acc2.Description = 'Account is Active';

        Account acc3 = new account();
        acc3.Name = 'test 3';
        acc3.Industry = 'Banking';
        acc3.Description = 'Account is Inactive';

        List<account> listAcc = new List<account>{acc, acc2, acc3};
        insert listAcc;

        list<account> allAccounts = [SELECT id, description FROM account];
        for (account eachAcc : allAccounts) {
            if (eachAcc.Description == 'Account is Active') {
                assert.isTrue(eachAcc.Description.contains('Active'));        
            }else {
                assert.isTrue(eachAcc.Description.contains('Inactive'));
            }        
        }      
    }
    
}