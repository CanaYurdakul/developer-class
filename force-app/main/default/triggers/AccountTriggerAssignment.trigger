trigger AccountTriggerAssignment on Account (before insert, before update, after insert, after update) {
    Map<id, account> trgNewMap = trigger.newMap;
    Map<id, account> trgOldMap = trigger.oldMap;

    if(Trigger.isBefore && Trigger.isInsert){
        system.debug('=====BEFORE INSERT===== ==>');
        system.debug('trigger new => ' + trigger.new);
        system.debug('trigger old => ' + trigger.old);
        system.debug('trigger.newMap => ' + trgNewMap);
        system.debug('trigger.oldMap => ' + trgOldMap);
     }
     if(Trigger.isAfter && Trigger.isInsert){
        system.debug('=====AFTER INSERT===== ==>');
        system.debug('trigger new => ' + trigger.new);
        system.debug('trigger old => ' + trigger.old);
        system.debug('trigger.newMap => ' + trgNewMap);
        system.debug('trigger.oldMap => ' + trgOldMap);
        system.debug('New account name ==> ' + trgNewMap);
     }
     if(Trigger.isBefore && Trigger.isUpdate){
        system.debug('=====BEFORE UPDATE===== ==>');
        system.debug('trigger new => ' + trigger.new);
        system.debug('trigger old => ' + trigger.old);
        system.debug('trigger.newMap => ' + trgNewMap);
        system.debug('trigger.oldMap => ' + trgOldMap);
     }
     if(Trigger.isAfter && Trigger.isUpdate){
         system.debug('=====AFTER UPDATE===== ==>');
         system.debug('trigger new => ' + trigger.new);
         system.debug('trigger old => ' + trigger.old);
         system.debug('trigger.newMap => ' + trgNewMap);
         system.debug('trigger.oldMap => ' + trgOldMap);
         for (Account eachAcc : trigger.new) {
            system.debug('new account name ==> ' + trigger.newMap.get(eachAcc.Id));   
            system.debug('old account name ==> ' + trigger.oldMap.get(eachAcc.Id));
          }
      }
}