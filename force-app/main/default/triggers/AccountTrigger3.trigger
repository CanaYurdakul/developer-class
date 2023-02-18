/*
trigger AccountTrigger3 on Account (before insert, before update, after insert, after update) {
    
    if(Trigger.isBefore){
        system.debug('We are in BEFORE Trigger');
        
        if(Trigger.isInsert){
            for (account acc : Trigger.new){
                system.debug('before insert Account Name ==> ' + acc.Name);
                system.debug('before insert Account Rating ==> ' + acc.Rating);
                system.debug('before insert Account Description ==> ' + acc.Description);
                system.debug('before insert Account Mailing City ==> ' + acc.Mailing_City__c);
            } 
        }
        if(Trigger.isUpdate){
            for (account acc : Trigger.new){
                system.debug('before update Account Name ==> ' + acc.Name);
                system.debug('before update Account Rating ==> ' + acc.Rating);
                system.debug('before update Account Description ==> ' + acc.Description);
                system.debug('before update Account Mailing City ==> ' + acc.Mailing_City__c);
            }
        }
    }
    if(Trigger.isAfter){
        system.debug('We are in AFTER Trigger');
       
        if(Trigger.isInsert){
            for (account acc : Trigger.new){
                system.debug('after insert Account Name ==> ' + acc.Name);
                system.debug('after insert Account Rating ==> ' + acc.Rating);
                system.debug('after insert Account Description ==> ' + acc.Description);
                system.debug('after insert Account Mailing City ==> ' + acc.Mailing_City__c);
            } 
        }
        if(Trigger.isUpdate){
            for (account acc : Trigger.new){
                system.debug('after update Account Name ==> ' + acc.Name);
                system.debug('after update Account Rating ==> ' + acc.Rating);
                system.debug('after update Account Description ==> ' + acc.Description);
                system.debug('after update Account Mailing City ==> ' + acc.Mailing_City__c);
            }
        }
    }
} 
