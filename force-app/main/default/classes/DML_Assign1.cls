public class DML_Assign1 {
    public void insertRecords() {
        List<Account> AccountList = new List<Account>();    
        for (Integer i = 0; i < 20; i++) {
            account acc = new account();
            acc.Name = 'Test Account Created' +i;
            AccountList.add(acc);     
        }
        insert AccountList;
    }
    public void updateRecords(){
        List<Account> updateAccounts = [SELECT id, name FROM account order by CreatedDate desc LIMIT 20];
        for (Account eachAccount : updateAccounts) {
            eachAccount.Name += ' Updated';   
        }
        update updateAccounts;
    }    
}