trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    system.debug('--------Trigger start---------');

    if (Trigger.isBefore) {
        AccountTriggerHandler.updateDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('Trigger.isAfter ' + Trigger.isAfter);
        system.debug('Trigger.isUpdate ' + Trigger.isUpdate);
        AccountTriggerHandler.updateVIPforContact(trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);       
    }
    

















    








    
    //Map<id, account>trgNewMap = trigger.newMap;
   // Map<id, account>trgOldMap = trigger.oldMap;

    //if(Trigger.isBefore && Trigger.isUpdate){
    //    integer countWebsiteChange = 0;

    //    for (Id eachId : trgNewMap.keySet()) {
    //        Account newAccount = trgNewMap.get(eachId);
    //        Account oldAccount = trgOldMap.get(eachId);
//
    //        system.debug('new account website field value ' + newAccount.Website);
    //        system.debug('old account website field value ' + oldAccount.Website);
    //        if (newAccount.website != oldAccount.Website) {
    //            system.debug('for account ' + newAccount.Name + ' , new website is ' + //    }
    //    system.debug('number of records where website is changed ' + countwebsiteChange);
    //}

    //if (Trigger.isAfter && Trigger.isUpdate) {
    //    Set<id> setIds = trgNewMap.keySet();
    //    
    //    for (Id eachID : setIds) {
    //        Account newAcc = trgNewMap.get(eachId);
    //        Account oldAcc = trgOldMap.get(eachId);
//
    //        string newName = newAcc.Name;
    //        string oldName = oldAcc.Name;
//
    //        system.debug('new account name is ' + newName + ' , old account name was ' + //oldName);
    //        //system.debug('new account name is v2 ' + trigger.newMap.get(eachId).Name);
    //    }
   // }

    //if(Trigger.isBefore && Trigger.isInsert){
    //   system.debug('=====BEFORE INSERT===== ==>');
    //   system.debug('trigger.newMap => ' + trgNewMap);
    //   system.debug('trigger.oldMap => ' + trgOldMap);
    //}
    //if(Trigger.isAfter && Trigger.isInsert){
    //   system.debug('=====AFTER INSERT===== ==>');
    //    system.debug('trigger.newMap => ' + trgNewMap);
    //   system.debug('trigger.oldMap => ' + trgOldMap);
    // }
    // if(Trigger.isBefore && Trigger.isUpdate){
    //    system.debug('=====BEFORE UPDATE===== ==>');
    //    system.debug('trigger.newMap => ' + trgNewMap);
    //    system.debug('trigger.oldMap => ' + trgOldMap);
    // }
    // if(Trigger.isAfter && Trigger.isUpdate){
    //    system.debug('=====AFTER UPDATE===== ==>');
    //    system.debug('trigger.newMap => ' + trgNewMap);
    //    system.debug('trigger.oldMap => ' + trgOldMap);
    // }

        //if(Trigger.isAfter && Trigger.isUpdate){
       // for(account oldAcc : trigger.old){
    //   //     system.debug('Old acc id ==> ' + oldAcc.Id + ', Old acc name ==> ' + oldAcc.name); 
    //    }
//
    //    for(account newAcc : trigger.new){
    //        system.debug('New acc id ==> ' + newAcc.Id + ', New acc name ==> ' + newAcc.name); 
    //    }
    //}




    //if(Trigger.isBefore && Trigger.isInsert){
    //   system.debug('trigger.new in BEFORE INSERT ==> ' + trigger.old);
    //}
    //if(Trigger.isAfter && Trigger.isInsert){
    //    system.debug('trigger.new in AFTER INSERT ==> ' + trigger.old);
    //}
    //if(Trigger.isBefore && Trigger.isUpdate){
    //    system.debug('trigger.new in BEFORE UPDATE ==> ' + trigger.old);
    // }
    // if(Trigger.isAfter && Trigger.isUpdate){
    //     system.debug('trigger.new in AFTER UPDATE ==> ' + trigger.old);
    // }








    //if(Trigger.isBefore && Trigger.isInsert){
    //    system.debug('trigger.new in BEFORE INSERT ==> ' + trigger.new);
    //}
    //if(Trigger.isAfter && Trigger.isInsert){
    //    system.debug('trigger.new in AFTER INSERT ==> ' + trigger.new);
    //}
    //if(Trigger.isBefore && Trigger.isUpdate){
    //    system.debug('trigger.new in BEFORE UPDATE ==> ' + trigger.new);
    //}
    //if(Trigger.isAfter && Trigger.isUpdate){
    //    system.debug('trigger.new in AFTER UPDATE ==> ' + trigger.new);
    //}
    
    //List<Account> newAccounts = trigger.new;
      //if(Trigger.isAfter){
       // system.debug('after insert/update new recordes : ' + newAccounts);
       // system.debug('number of records inserted/updated ' + newAccounts.size());
     // }
//
    //    for(Account eachAcc : newAccounts){
    //        system.debug('new acc id is ' + eachAcc.Id + ', new acc name is ' + eachAcc.Name);
    //    }
    //}
    //system.debug('====== trigger end ======= '); 

















    
    //system.debug('Trigger.isBefore ==> ' + Trigger.isBefore);
    //system.debug('Trigger.isAfter ==> ' + Trigger.isAfter);

    //system.debug('Trigger.isInsert ==> ' + Trigger.isInsert);
    //system.debug('Trigger.isUpdate ==> ' + Trigger.isUpdate);
    
    //WILL BE TRUE FOR AFTER INSERT
    //if(Trigger.isAfter && Trigger.isInsert){
    //    system.debug('after insert trigger called.');
    //}
    //WILL BE TRUE FOR BEFORE INSERT
    //if(Trigger.isBefore && Trigger.isInsert){
    //    system.debug('before insert trigger called.');
    //}
    //WILL BE TRUE FOR AFTER UPDATE
    //if(Trigger.isAfter && Trigger.isUpdate){
    //    system.debug('after update trigger called.');
    //}
    //WILL BE TRUE FOR BEFORE UPDATE
    //if(Trigger.isBefore && Trigger.isUpdate){
    //    system.debug('before update trigger called.');
    //}
    system.debug('====== trigger end ======= '); 










    //system.debug('trigger.isInsert ==> ' + trigger.isInsert);
    //if(trigger.isInsert){
        //system.debug('before insert trigger called.');
    //}
    //system.debug('trigger.isUpdate ==> ' + trigger.isUpdate);
    //if(trigger.isUpdate){
        //system.debug('before update trigger called.');
    //}

    




    //system.debug('Trigger.isBefore ==> ' + Trigger.isBefore);
    //system.debug('Trigger.isAfter ==> ' + Trigger.isAfter);
    //if(Trigger.isBefore){
    //    system.debug('Before insert trigger called.');
    //}
    //if(Trigger.isAfter){
    //    system.debug('After insert trigger called.');
    //}

    
}
