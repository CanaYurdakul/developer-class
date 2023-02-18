public class AccountTriggerHandler {
    public static void updateDescription(List<account> accTriggerNew, List<account> accTriggerOld, Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
        for (Account eachAccount : accTriggerNew) {
            if (Trigger.isInsert && eachAccount.active__c == 'Yes') {
                eachAccount.Description = 'Account is active now. Enjoy!';      
            } 
            if (Trigger.isUpdate) {
                string newActive = eachAccount.active__c;
                Account oldAccount = accTriggerOldMap.get(eachAccount.Id);
                string oldActive = oldAccount.active__c;
                if (newActive != oldActive && newActive == 'Yes') {
                    eachAccount.Description = 'Account is active now. Enjoy,enjoy!';    
                }
            }     
        }    
    }
}