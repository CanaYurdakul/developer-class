public class AnnotationAssignment {
    @invocableMethod
    public static void receiveProjectId(List<id> listid) {
        List<Salesforce_Ticket__c> listST = [SELECT id, status__c, Salesforce_Project__c FROM Salesforce_Ticket__c WHERE id IN : listid AND status__c != 'Completed'];
        for (Salesforce_Ticket__c eachST : listST) {
            eachST.Status__c = 'Completed';
            listST.add(eachST);    
        }
        if (!listST.isEmpty()) {
            update listST;     
        }       
    }
}