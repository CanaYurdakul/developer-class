trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, before update, after insert, after update ){
    if(Trigger.isAfter && Trigger.isInsert){
      system.debug('call method now...');
      SPTriggerHandler.updateProjectDescription(trigger.newMap.keySet());
      system.debug('method JUST called...');
       SPTriggerHandler.createDefaultTicket(Trigger.new);
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
       SPTriggerHandler.validateStatusCompletion(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);    
    }
   
}