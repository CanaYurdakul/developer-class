@istest 
public class AccountsBatchTest {
    @istest
    private static void testBatch1() {
        List<account> listAcc = new List<account>();    
        for (Integer i = 0; i < 900; i++) {
            account a = new account();
            a.Name = 'batch test';
            a.Description = 'test';
            a.Active__c = 'Yes';
            listAcc.add(a);
        }
        insert listAcc;
        
        Test.startTest();
        AccountsBatch ab = new AccountsBatch();
        Database.executeBatch(ab, 950);
        tEST.stopTest();

        List<account> allAccounts = [SELECT id, description FROM account];
        for (account eachAccount : allAccounts) {
            assert.isTrue(eachAccount.Description.containsIgnoreCase('batch'));        
        }
    }
}