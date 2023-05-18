public class AccountsQueueable implements Queueable{
    List<account> listAccount = new List<account>();
    public AccountsQueueable(List<account> accs) {
        listAccount = accs;
    }
    public void execute(QueueableContext qc){
        system.debug('inside execute method listAccount ==> ' + listAccount);
        for (account eachAcc : listAccount) {
            eachAcc.Name += '--SI';        
        }
        update listAccount;
    }
}