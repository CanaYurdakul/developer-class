@isTest 
public  class DmlDemoAgainTest {
    @isTest 
    private static void testInsertStndObj() {

        DmlDemoAgain.dmlDemoInsert_stndObj1();
        List<account> accs = [SELECT id, name FROM account WHERE name = 'Softinnovas'];
        system.assertEquals(1, accs.size());   
        system.assertEquals('Softinnovas', accs[0].Name); 
    }
    @isTest 
    private static void testInsertCustomObj() {
        DmlDemoAgain.dmlDemoInsert_cstmObj();
        List<Salesforce_Project__c> listSP = [SELECT id, name, project_name__c FROM Salesforce_Project__c];
        system.assertEquals('Learn dml', listSP[0].Project_Name__c);
    }
    @isTest
    private static void testUpdateDemo_stndObj2() {
        //1. Prepare data
        Account acc = new account();
        acc.Name = 'Softinnovas';
        insert acc;


        //this method NEEDs one account with name 'Softinnovas.'
        DmlDemoAgain.dmlUpdateDemo_stndObj2();

        //verify.
        //soql
        Account updatedAcc = [select id, name, phone from account limit 1];
        //assert
        system.assertEquals('Softinnovas Inc.', updatedAcc.Name);
        assert.areEqual('Softinnovas Inc.', updatedAcc.Name);
    }
    @isTest 
    private static void testInsertDemo_stndObj2() {
        Account acc = new account();
        acc.Name = 'Softinnovas';
        insert acc;
        DmlDemoAgain.dmlInsertDemo_stndObj2();
        contact con = [SELECT lastName, accountId FROM contact WHERE lastName = 'Biden' LIMIT 1];
        assert.areEqual(acc.id, con.AccountId);
        system.assertEquals(acc.Id, con.AccountId);       
    }
    @isTest 
    private static void testInsertDemo_cstmObj2() {
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'test project';
        insert sp;

        DmlDemoAgain.dmlDemoInsert_cstmObj2();
        Salesforce_Ticket__c sst = [SELECT subject__c, priority__c, status__c, salesforce_project__c FROM Salesforce_Ticket__c WHERE Subject__c = 'create related record via apex'];
        assert.areEqual(sp.Id, sst.Salesforce_Project__c);
        assert.areEqual('High', sst.Priority__c);        
    }
}