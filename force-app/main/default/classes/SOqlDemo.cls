public class SOqlDemo {
    public static void accountSOQL_1(){
        List<account> listAcc =[select id, name, phone from account order by createddate desc];
        system.debug('List of accounts ' + listAcc);
    }
    //it is just for account
    public static void accountSOQL_11(){
        account acc= [select id, name, phone from account order by createddate desc limit 1];
        system.debug('account acc ' + acc);
    }
    public static void accountSOQL_2(){
        account acc = [select id, name, phone, AccountNumber from account order by createddate desc limit 1];
        system.debug('accounts acc ' + acc);

        string aName = acc.name;
        string aPhone = acc.phone;
        system.debug('account name is ' + aName + ' phone is ' + aPhone + ' , account number is ' + acc.AccountNumber);     
    }
    public static void accountSOQL_3(){
        List<account> listAccount = [select id, name, phone, accountNumber from account order by createddate];
        for (account eachAccount : listAccount){
            system.debug('------eachAccount loop STARTS-------');
            system.debug('each account record ' + eachAccount);
            string accName = eachAccount.Name;
            string accPhone = eachAccount.Phone;
            system.debug('account name is ' + accName + ' , account phone is ' + accPhone + ' , account number is ' + eachAccount.accountNumber);
            system.debug('------eachAccount loop ENDS--------');           
        }
    }
    public static void accountFilter_SOQL(){
        string accountNameFilter = 'sForce';
        List<account> listAcc = [select id, name from account where name = : accountNameFilter];
        system.debug('list acc ' + listAcc);
    }
    public static void accountFilter_SOQL(string accountNameFilter){
        List<account> listAcc = [select id, name from account where name = : accountNameFilter];
        system.debug('list acc ' + listAcc);
    }
    public static void childToParent_SOQL1(){
        List<contact> listContact = [select id, name, phone, account.name, account.industry from contact where account.industry = 'energy'];
        for (contact eachContact : listContact) {
            string accName = eachContact.account.name;
            system.debug('contact name is ' + eachContact.Name + ' , its account is ' + accName);
        }
    }
    public static void parentToChild_SOQL1(){
        List<Account> listAcc = [select name, annualrevenue, (select name, amount from opportunities where stagename = 'Closed won') from account where type = 'Customer - direct'];
        for (account eachAcc : listAcc) {
            system.debug('account name is ' + eachAcc.Name + ' , acc annual revenue ' + eachAcc.AnnualRevenue);
            list<Opportunity> eachAccOpp = eachAcc.Opportunities;
            system.debug('-------');
            for (Opportunity eachOpp : eachAccOpp) {
                system.debug('opp name ' + eachopp.Name + ', amount is ' + eachOpp.Amount);
            }
            system.debug('_______');
        }
    }
    public static void parentToChild_SOQL2(){
       List<salesforce_project__c > listSP = [select name, project_name__c, (select subject__c, priority__c from salesforce_tickets__r) from salesforce_project__c]; 
       for (salesforce_project__c eachSP : listSP) {
        List<salesforce_ticket__c> listST = eachSP.salesforce_tickets__r;
        integer totalTickets = listST.size();
        integer highPriorityST = 0;
        for (salesforce_ticket__c eachST : listST) {
            if (eachST.priority__c == 'High') {
                highPriorityST++;
            }
        }
        system.debug('Project name ' + eachSP.name + ' , total tickets ' + totalTickets + ' high priority tickets are ' + highPriorityST);   
       }
    }
}