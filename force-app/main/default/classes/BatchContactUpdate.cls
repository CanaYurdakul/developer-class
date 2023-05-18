public class BatchContactUpdate implements Database.Batchable <Sobject>{
    public Database.QueryLocator start (Database.BatchableContext dbc){
        Database.QueryLocator db = database.getQueryLocator([SELECT id, description, Account.description FROM Contact WHERE AccountId != null]);
        return db;
    }
    public void execute (Database.BatchableContext dbc, list<contact> scope) {
        for (contact eachCon : scope) {
            eachCon.description = eachCon.Account.description;
            eachCon.Account.description += ' ...Updated from Account with Batch';
        }
        update scope;       
    }
    public void finish (Database.BatchableContext dbc){
        system.debug('Finish method called');
    }
}