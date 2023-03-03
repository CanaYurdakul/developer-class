trigger ContactTrigger on Contact (before insert, after insert, before update, after update, after delete, after undelete) {

    if (Trigger.isBefore && Trigger.isUpdate) {
        //ContactTriggerHandler.contactUpdateValidation(trigger.new, trigger.old, trigger.newmap,trigger.oldmap);
        ContactTriggerHandler.contactUpdateValidation1(trigger.new, trigger.old, trigger.newmap,trigger.oldmap);
    }
    if (Trigger.isAfter) {
        ContactTriggerHandler.rollUpSummaryUpdate(trigger.new, trigger.old, trigger.newmap,trigger.oldmap);   
    }
}