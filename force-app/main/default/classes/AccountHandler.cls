public class AccountHandler {
    public static void createContact(list<Account> triggerNew) {
        List<Contact> listCont = new List<Contact>();
        for (Account eachAcc : TriggerNew) {
            contact cnt = new Contact();
            cnt.AccountId = eachAcc.Id;
            cnt.LastName = 'Handler';
            listCont.add(cnt);    
        }
        if(!listCont.isEmpty()){
            insert listCont;
        }
        
    }
}