public class SoqlParentChildRelationship {
    public static void childToParent() {
        List<Contact> listContact = [select id, name, account.name, account.id from contact];
        for (contact eachContact : listContact) {
            system.debug('Account name is ' + eachContact.account.Name + ', its ID is ' + eachContact.account.id);
        }
    }
    public static void parentToChild() {
        List<Account> listAccount = [select id, name, (select id, name from contacts) from account];
        for (Account eachAccount : listAccount) {
            List<Contact> eachContact = eachAccount.Contacts;
            for (Contact cnt : eachContact) {
                system.debug('Contact name is ' + cnt.name + ' , its ID is ' + cnt.Id);
            }
            
        }
    }
}