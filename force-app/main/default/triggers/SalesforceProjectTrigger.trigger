trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, before update, after insert, after update ){

  TriggerSwitch__mdt ts = TriggerSwitch__mdt.getInstance('salesforce_project_c');
  if (!ts.enabled__c) {
    return;    
  }

    if(Trigger.isAfter && Trigger.isInsert){
      system.debug('call method now...');
      SPTriggerHandler.updateProjectDescription(trigger.newMap.keySet());
      system.debug('method JUST called...');
       SPTriggerHandler.createDefaultTicket(Trigger.new);
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
      system.debug('before update project called');
      // SPTriggerHandler.validateStatusCompletion(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);    
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
      SPTriggerHandler.projectStatusChange(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);    
    }  
}