trigger AccountTriggerAssg on Account (before insert, before update, after insert, after update) {
    if (trigger.isBefore && trigger.isInsert) {
        for (Account eachAcc : trigger.new) {
            if (eachAcc.Active__c == 'Yes') {
                eachAcc.Description = 'Account is Active';    
            }
            if (eachAcc.Active__c == 'No') {
                eachAcc.Description = 'Account is Inactive';
            }    
        }     
    }
    if (trigger.isbefore && trigger.isUpdate) {
        for (account eachAcc : trigger.new) {
            if (eachAcc.Active__c == 'Yes' && trigger.oldMap.get(eachAcc.Id).Active__c != eachAcc.Active__c) {
                eachacc.Description = 'Account is Active';    
            }
            if (eachAcc.Active__c == 'No' && trigger.oldMap.get(eachAcc.Id).Active__c != eachAcc.Active__c) {
                eachAcc.Description = 'Account is Inactive';
            }    
        }
    }
}