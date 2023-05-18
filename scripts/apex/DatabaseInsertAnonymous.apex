List<account> listAccount = new List<account>();

Account a = new account();
a.Name = 'test accccc';
listAccount.add(a);

Account a1 = new account();
a1.Name = 'test acccccdddd';
listAccount.add(a1);

Account a2 = new account();
a2.Name = 'test acccdddeee';
listAccount.add(a2);

Account a3 = new account();
listAccount.add(a3);

Account a4 = new account();
listAccount.add(a4);

Account a5 = new account();
listAccount.add(a5);

//insert listAccount;
//Database.insert(listAccount, false);
List<Database.SaveResult> listResult = Database.insert(listAccount, false);
for (Database.SaveResult eachResult : listResult) {
    if (eachResult.isSuccess()) {
        system.debug('account record inserted successfully, account record id is ' + eachResult.getId());       
    }else {
        system.debug('account insert FAILED. Error is ' + eachResult.getErrors());
    }  
}

//USE database.insert(list, false) wherever possible.