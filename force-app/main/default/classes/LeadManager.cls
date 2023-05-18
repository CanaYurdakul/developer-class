@RestResource(urlMapping='/Lead/*')
global with sharing class LeadManager {
    //https://ddn000005kxpkmaw-dev-ed.develop.my.salesforce.com/services/apexrest/Lead/00QDn0000031Ci0MAE

    @HttpGet
    global static Lead getLead(){
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id leadId = endpoint.substring(lastIndex+1);
        Lead ld = [SELECT FirstName, LastName, Company, Title, LeadSource, Email, Phone FROM Lead WHERE Id = :leadId];
        return ld;
    }

    @HttpPost 
    global static Id postLead(String firstName, String lastName, String company, String title, String leadSource, String email, String phone){
        Lead ld= new Lead();
        ld.FirstName = firstName;
        ld.LastName = lastName;
        ld.Company = company;
        ld.Title = title;
        ld.LeadSource = leadSource;
        ld.Email = email;
        ld.Phone = phone;
        insert ld;
        return ld.Id;
    }

    @HttpDelete 
    global static String deleteLead(){
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id ldId = endpoint.substring(lastIndex+1);
        try {
            Lead ld = [SELECT Id FROM Lead WHERE Id = :ldId];
            delete ld;   
        } catch (Exception ex) {
            return 'Failed';        
        }
        return 'Success';   
    }

    @HttpPut 
    global static Lead putLead(){
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Lead ld = (Lead)JSON.deserialize(BODY, Lead.class);
        upsert ld;
        return ld;
    }

@HttpPatch 
    global static Lead patchLead(){
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Lead ld = (lead)JSON.deserialize(body, Lead.class);
        update ld;
        Lead updatedLead = [SELECT Id, FirstName, LastName, Title FROM Lead WHERE Id = :ld.Id];
        return updatedLead;
    }    
}