public class DmlDemo {
    public static void dmlDemoInsert_stndObj1() {
        account acc = new account();
        acc.Name = 'Softinnovas';
        insert acc;
    }
    public static void dmlDemoInsert_cstmObj() {
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Learn dml';
        sp.Description__c = 'Learn dml batch14';
        sp.Status__c = 'New';

        insert sp;
    }
    public static void dmlUpdateDemo_stndObj1() {
        Account ac = new account();
        ac.Name = 'Salesforce';
        system.debug('Before inserting ac ' + ac);
        insert ac;
        system.debug('Record is inserted now ac: ' + ac);

        ac.Name = 'Salesforce Inc.';
        update ac;
    }
    public static void dmlUpdateDemo_stndObj2() {
        account acc = [select id, name from account where name like 'Softinnovas%' limit 1];
        acc.Name = 'Softinnovas Inc.';
        acc.Phone = '67890123';
        update acc;
        system.debug('acc ' + acc);
    }
    public static void dmlInsertDemo_stndObj2() {
        account acc = [select id, name from account where name like 'Softinnovas%' limit 1];
        contact c = new contact();
        c.LastName = 'Biden';
        c.AccountId = acc.Id;
        insert c;
    }
}