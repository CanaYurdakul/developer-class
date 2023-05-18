public class AccountsBatch implements database.Batchable<SObject>, Database.stateful{
    integer recordCount = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator db = database.getQueryLocator([SELECT id, active__c, description FROM account]);
        return db;
    }
    public void execute(Database.BatchableContext bc, List<Account> scope){
        system.debug('Inside execute method');
        //system.debug('Number of record to process is ' + scope.size());
        system.debug('Record count : START: ' + recordCount);

        List<account> updateAccount = new List<account>();
        for (account eachAcc : scope) {
            if (eachAcc.Active__c != 'No') {
                eachAcc.Description += '...Updated VIA batch. OKAY?';
                updateAccount.add(eachAcc);        
            }
        }
        if (!updateAccount.isEmpty()) {
            recordCount += updateAccount.size();
            update updateAccount; 
            system.debug('Record count : AFTER: ' + recordCount);       
        }    
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Finish method called. All records are processed.');
        system.debug('Record count : FINISH : ' + recordCount);
    }
}