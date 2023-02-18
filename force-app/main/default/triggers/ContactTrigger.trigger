trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {

    if(Trigger.isBefore){
        system.debug('We are in BEFORE Triggers.');
        if(Trigger.isInsert){
            system.debug('Before insert trigger');
        }
        if(Trigger.isUpdate){
            system.debug('Before update trigger');
        }
    }

    if(Trigger.isAfter){
        system.debug('We are in AFTER Triggers.');
        if(Trigger.isInsert){
            system.debug('After insert trigger');
        }
        if(Trigger.isUpdate){
            system.debug('After update trigger');
        }
    }

}