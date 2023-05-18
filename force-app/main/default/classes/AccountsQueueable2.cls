public class AccountsQueueable2 implements Queueable{
    List<account> listAccount = new List<account>();
    public AccountsQueueable2(List<account> accs) {
        listAccount = accs;
    }
    public void execute(QueueableContext qc){
        system.debug('inside execute method listAccount ==> ' + listAccount);
        for (account eachAcc : listAccount) {
            string newName = eachAcc.Name.removeEnd('--SI');
            eachAcc.Name = newName;        
        }
        update listAccount;
    }
}