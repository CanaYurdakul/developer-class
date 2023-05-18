public class SPTriggerHandler {
    public static void createDefaultTicket(List<salesforce_project__c> spTriggerNew) {
        try{
            //DefaultTicketInfo__c dtInfo = DefaultTicketInfo__c.getOrgDefaults();
            DefaultTicketInfo__c dtInfo; 
            Profile adminProfile = [SELECT id, name FROM profile WHERE name = 'System Administrator'];
            if (UserInfo.getProfileId() == adminProfile.Id) {
                dtInfo = DefaultTicketInfo__c.getInstance(adminProfile.Id);        
            }else {
                dtInfo = DefaultTicketInfo__c.getOrgDefaults();
            }

            List<Salesforce_Ticket__c> newST = new List<Salesforce_Ticket__c>();
            for (Salesforce_Project__c eachSP : spTriggerNew) {
               Salesforce_Ticket__c st = new Salesforce_Ticket__c();
               st.Subject__c = dtInfo.Subject__c;
               st.Salesforce_Project__c = eachSP.Id;
               st.Priority__c = 'High';
               st.Description__c = dtInfo.Description__c;
               newST.add(st);    
            }
            if (!newST.isEmpty()) {
               insert newST;   
            }      
        }catch(Exception ex){
            string errorMessage = system.label.SPTriggerError;
            for(Salesforce_Project__c eachSP : spTriggerNew){
                eachSP.addError(errorMessage);
                //('Error in creating default ticket. Please contact your administrator, NOT developer');
            }

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
    public static void projectStatusChange(List<Salesforce_Project__c> spTriggerNew, List<Salesforce_Project__c> spTriggerOld, Map<id, Salesforce_Project__c> spTriggerNewMap, Map<id, Salesforce_Project__c> spTriggerOldMap) {

        Set<id> projectIds = new Set<id>();
        for (Salesforce_Project__c eachSP : spTriggerNew) {
            if (eachSP.Status__c =='completed' && eachSP.Status__c != spTriggerOldMap.get(eachSP.Id).Status__c) {
                projectIds.ADD(eachSP.Id);        
            }        
        }
        if (!projectIds.isEmpty()) {
            updateTicketStatus(projectIds);
        }       
    }  
    @testVisible 
    @future
    private static void updateTicketStatus(set<id> spIds) {
        List<Salesforce_Ticket__c> listST = [SELECT id, status__c, Salesforce_Project__c FROM Salesforce_Ticket__c WHERE Salesforce_Project__c IN :spIds AND status__c != 'Completed'];
        for (Salesforce_Ticket__c st : listST) {
            st.status__c ='Completed';        
        }
        update listST;      
    } 
}