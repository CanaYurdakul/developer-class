public class SPTriggerHandler {
    public static void createDefaultTicket(List<salesforce_project__c> spTriggerNew) {
        List<Salesforce_Ticket__c> newST = new List<Salesforce_Ticket__c>();
        for (Salesforce_Project__c eachSP : spTriggerNew) {
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c = 'Default ST';
            st.Salesforce_Project__c = eachSP.Id;
            newST.add(st);    
        }
        if (!newST.isEmpty()) {
            insert newST;   
        }      
    }
    public static void validateStatusCompletion(List<Salesforce_Project__c> spTriggerNew, List<Salesforce_Project__c> spTriggerOld, Map<id, Salesforce_Project__c> spTriggerNewMap, Map<id, Salesforce_Project__c> spTriggerOldMap) {
          Set<id> spIds = new Set<id>();

          for (Salesforce_Project__c eachSP : spTriggerNew) {
            if (eachSP.Status__c != spTriggerOldMap.get(eachSP.id).Status__c && eachSP.Status__c == 'Completed') {
                spIds.add(eachSP.Id);    
            }    
          }
          if(!spIds.isEmpty()){
            List<Salesforce_Ticket__c> listST = [SELECT id, Status__c, Salesforce_Project__c FROM Salesforce_Ticket__c WHERE Salesforce_Project__c IN :spIds AND Status__c != 'Completed'];
            for (Salesforce_Ticket__c eachST : listST) {
                Id projectId = eachST.Salesforce_Project__c;
                Salesforce_Project__c newProject = spTriggerNewMap.get(projectId);
                newProject.Status__c.addError('Cannot complete project beacuse all tickets are NOT completed');    
            }
          }
    }
    @future 
    public static void updateProjectDescription(Set<id> spIds) {
        List<Salesforce_Project__c> listSP = [SELECT id, description__c FROM Salesforce_Project__c WHERE id IN : spIds];
        for (Salesforce_Project__c eachSP : listSP) {
            eachSP.Description__c = 'Updated from future';
        }
        update listSP;
    }    
}