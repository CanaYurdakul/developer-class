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
    public static void dmlDemoInsert_cstmObj2() {
        Salesforce_Project__c sp = [Select id from Salesforce_Project__c order by CreatedDate desc limit 1];
        Salesforce_Ticket__c newSt = new Salesforce_Ticket__c();
        newST.Subject__c = 'create related record via apex';
        newSt.Priority__c = 'High';
        newSt.Requested_by_date__c = date.today();
        newSt.Salesforce_Project__c = sp.Id;
        insert newSt;  
    }
    public static void dmlDemoMultipleInsert_right1() {
        List<account> listAccount = new List<account>();

        account acc1 = new account();
        acc1.Name = 'Bulk acc1';
        acc1.ShippingCity = 'New York';
        acc1.Active__c = 'No';
        listAccount.add(acc1);

        account acc2 = new account();
        acc2.Name = 'Bulk acc2';
        acc2.ShippingCity = 'DC';
        acc2.Active__c = 'Yes';
        listAccount.add(acc2);

        account acc3 = new account();
        acc3.Name = 'Bulk acc3';
        acc3.ShippingCity = 'DC';
        acc3.Active__c = 'Yes';
        listAccount.add(acc3);

        insert listAccount;
    }
    public static void dmlDemoMultipleInsert_right2() {
        List<account> insertAccountList = new List<account>();  
        for (Integer i = 0; i < 166; i++){
            account a = new account();
            a.Name = 'Softinnovas v'+i;
            a.Phone = '987654321'+i;
            a.AccountNumber = 'rt'+i;
            a.Active__c = 'Yes';
            insertAccountList.add(a);
        }
        if (!insertAccountList.isEmpty()) {
            insert insertAccountList;
        }
    }
    public static void dmlDemoMultipleUpdate_right1() {
        List<account> listAccount = [select id, name from account order by CreatedDate desc limit 50];
        for (account eachAcc : listAccount) {
            eachAcc.Name = eachAcc.Name + ' B.O';
        }
        update listAccount;     
    }
    public static void dmlDemoMultipleUpdate_right2() {
        List<account> listAccount = [select id, name, Active__c from account];
        List<account> updateAccountList = new List<account>();

        for (account eachAcc : listAccount) {
            if (eachAcc.Active__c == 'Yes') {
                eachAcc.Name = eachAcc.Name + ' Yy';
                updateAccountList.add(eachAcc);   
            }else if(eachAcc.Active__c == null) {
                eachAcc.Name = eachAcc.Name + ' Nn';
                updateAccountList.add(eachAcc);
            }
        }
        if (!updateAccountList.isEmpty()) {
            update updateAccountList;  
        }
    }

}