public class AccountUpdateHelper {
    @invocableMethod
    public static void updateAccountWebsite(list<id> accIds) {
        List<account> listAccount = [SELECT id, website FROM account WHERE id IN : accIds];
        for (Account eachAccount  : listAccount) {
            eachAccount.Website = 'www.softinnovas.com';    
        }
        update listAccount;    
    }
}