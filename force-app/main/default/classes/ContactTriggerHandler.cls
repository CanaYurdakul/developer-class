public class ContactTriggerHandler {
    public static void contactUpdateValidation(List<contact> conTriggerNew, List<contact> conTriggerOld, Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {

        for (contact eachContact : conTriggerNew) {
            contact oldContact = conTriggerOldMap.get(eachContact.id);

            if (oldContact.LeadSource == 'Partner Referral') {
                eachContact.addError('Cannont update Partner Referral contact.');   
            }
            
        }
    }
    public static void contactUpdateValidation1(List<contact> conTriggerNew, List<contact> conTriggerOld, Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {
        string errorMessage = system.label.ContactValidation1;
        for (contact eachContact : conTriggerNew) {
            if(eachContact.LeadSource != conTriggerOldMap.get(eachContact.Id).Leadsource){
                eachContact.LeadSource.addError(errorMessage);
               // ('Can not UPDATE lead Source. Please USER!!');
            }
            
        }
    }
 public static void rollUpSummaryUpdate(List<contact> conTriggerNew, List<contact> conTriggerOld, Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {
     
    Set<id> accountIds = new Set<id>();
     if (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete) {
         //for increase we Use trigger New//
         for (contact eachCon : conTriggerNew) {
             if (eachCon.AccountId != null) {
                 accountIds.add(eachCon.AccountId);    
             }    
         }    
     }
     if (Trigger.isDelete || Trigger.isUpdate) {
         for (contact eachCon : conTriggerOld) {
             if (eachCon.AccountId != null) {
                   accountIds.add(eachCon.AccountId);    
               }    
           }    
    }
    if (!accountIds.isEmpty()) {
        List<account> listAcc = [select id, number_of_contacts__c, (select id from contacts) from account where id in :accountIds];
        for (account eachAcc : listAcc) {
            integer numOfContacts = 0;
            if (eachAcc.contacts != null) {
                numOfContacts = eachAcc.contacts.size();    
            }
            eachAcc.number_of_contacts__c = numOfContacts;
           }
        if (!listAcc.isEmpty()) {
             update listAcc;   
        }        
    }
}
}