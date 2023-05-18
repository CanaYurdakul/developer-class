@isTest 
public class AccountsQueueableTest {

    private testmethod static void testQueueable1() {
        List<account> listAcc = new List<account>();
        for (Integer i = 0; i < 200; i++) {
            account a = new account();
            a.Name = 'queue test';
            a.Description = ' test';
            a.Active__c = 'Yes';
            listAcc.add(a);
        }
        insert listAcc;

        Test.startTest();
        system.enqueueJob(new AccountsQueueable(listAcc));
        Test.stopTest();

        integer countSI = [SELECT count() FROM account WHERE name LIKE '%--SI'];
        assert.areEqual(200, countSI);        
    }
}