public class AccountTriggerHandler {
    public static void updateDescription(List<account> accTriggerNew, List<account> accTriggerOld, Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
        
        for (Account eachAccount : accTriggerNew) {
            boolean updateDesc = false;
            if (Trigger.isInsert && eachAccount.active__c == 'Yes') {
                updateDesc = true;      
            } 
            if (Trigger.isUpdate) {
                string newActive = eachAccount.active__c;
                Account oldAccount = accTriggerOldMap.get(eachAccount.Id);
                string oldActive = oldAccount.active__c;
                if (newActive != oldActive && newActive == 'Yes') {
                    updateDesc = true;
                }
            }  
            if(updateDesc){
                eachAccount.Description = 'Account is active now. Enjoy,enjoy, enjoy!';  
            }   
        }    
    }
    public static void updateVIPforContact(List<account> accTriggerNew, List<account> accTriggerOld, Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
        Set<id> accIds = new Set<id>();
        for (account eachAccount : accTriggerNew) {
            if (eachAccount.VIP__c != accTriggerOldMap.get(eachAccount.Id).VIP__C) {
                accIds.add(eachAccount.Id);
                
            }
        }
        if (!accIds.isEmpty()) {
            List<contact> listContacts = [SELECT Id, vip__c, AccountId FROM contact WHERE AccountId IN : accIds];
        for (contact eachContact : listContacts) {
            Account newAcc = accTriggerNewMap.get(eachContact.AccountId);
            boolean accVIP = newAcc.VIP__c;

            eachContact.VIP__c = accVIP;    
        }
        if (!listContacts.isEmpty()) {
            update listContacts;   
        }      
        }
        
    }
    
}
