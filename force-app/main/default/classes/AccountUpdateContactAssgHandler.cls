public class AccountUpdateContactAssgHandler {
    @future 
    public static void updateNumberOfContacts(Set<Id>AccountIds){
        list<Account> listAcc = [SELECT id, name, Number_of_Contacts__c, (SELECT id FROM Contacts) FROM account WHERE id IN: AccountIds];
        for(account eachAcc : listAcc){
            integer numOfContacts = 0;
            if(eachAcc.Contacts != null){
                numOfContacts = eachAcc.Contacts.size();
            }
            eachAcc.Number_of_Contacts__c = numOfContacts;
        }
        if(!listAcc.isEmpty()){
            update listAcc;
        }
    }    
}