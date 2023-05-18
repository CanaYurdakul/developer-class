@isTest 
public class SPTriggerHandlerTest {
    @isTest 
    public static void testFutureMethod1() {
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Learn test';
        sp.Description__c = 'learn dml batch14';
        sp.Status__c = 'New';

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'Learn future test';
        sp2.Description__c = 'learn dml batch14';
        sp2.Status__c = 'New';

        List<Salesforce_Project__c> listSP = new List<Salesforce_Project__c>{sp, sp2};
        insert listSP;

        Set<id> spIds = new set<id>{sp.id, sp2.id};
        Test.startTest();
        SPTriggerHandler.updateProjectDescription(spIds);
        Test.stopTest();

        List<Salesforce_Project__c> allSP = [SELECT id, Description__c FROM Salesforce_Project__c];
        for (Salesforce_Project__c s : allSP) {
            assert.isTrue(s.Description__c.contains('future'));       
        }   
    }
}