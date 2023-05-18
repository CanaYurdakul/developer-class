public with sharing class OpportunityUpdateHelper {
    @invocableMethod (label='Close Opportunities' 
                      description = 'This method is going to close all the open opportunities when the account status is changed to Inactive or Hold' 
                      category='Account')

    public static void closeOpportunities(List<Id>AccountIds) {
        List<Opportunity>opps = [SELECT Id, StageName FROM Opportunity WHERE AccountId IN: accountIds AND StageName NOT IN ('Closed Won','Closed Lost') WITH SECURITY_ENFORCED];

        for(Opportunity eachOpp : opps){
            eachOpp.StageName = 'Closed Lost';
        }
        try{
            update opps;
        }catch(Exception ex){
            system.debug(ex.getMessage());
        }       
    }
}