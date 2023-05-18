public class ContactQueableApex implements Queueable{
    List<account> listAccount = new List<account>();
    public ContactQueableApex(list<account> acc) {
        listAccount = acc;
    }
    public void execute (QueueableContext qc){
        List<Contact> listContacts = new List<Contact>();
        for(Contact cnt : listContacts) {
            Contact c = new Contact();
            c.LastName = 'Que';
            c.Status__c = 'New';
            c.AccountId = cnt.Id;
            listContacts.add(c);
    }
    insert listContacts;
}
}