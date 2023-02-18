trigger ContactTrigger2 on Contact (before insert, before update) {

        for(contact cnt : Trigger.new){
            system.debug('Contact Name ==> ' + cnt.Name);
            system.debug('Contact Account Name ==> ' + cnt.Account.Name);
            system.debug('Contact Phone Number ==> ' + cnt.Phone);
            system.debug('Contact Email ==> ' + cnt.Email);
        }   
}