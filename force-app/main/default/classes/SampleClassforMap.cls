public class SampleClassforMap {
    public static void createMap() {
        List<contact> listContacts = [SELECT id, name, accountId FROM contact LIMIT 50];

        //create map of accountid and list<contacts>
        Map<id, list<contact>> mapAccIdToContact = new Map<id, list<contact>>();
        //go through each contact and add one by one contact in the list and keep updating map
        for (contact contactItem : listContacts) {
            //get account id of this contact
            Id accountId = contactItem.accountId;
            //create new TEMP list of contacts
        List<contact> cntTempList = new List<contact>();
        //check if map has existing list<contact> for 'AccountId'
        if (mapAccIdToContact.get(accountId) != null) {
            //if yes then set that list<contact> to 'cntTempList'
            cntTempList = mapAccIdToContact.get(accountId);
        }
        //now add the current contact(contactItem) in the cntTempList
        cntTempList.add(contactItem);
        //now put the current contact(contactItem) in the cntTempList
        mapAccIdToContact.put(accountId, cntTempList); 
        }    
        system.debug ('The final map is ==> ' + mapAccIdToContact);  
    }  
    
}