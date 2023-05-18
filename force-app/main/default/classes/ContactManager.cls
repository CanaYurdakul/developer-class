@RestResource(urlMapping='/Contact/*')
global with sharing class ContactManager {
    //https://ddn000005kxpkmaw-dev-ed.develop.my.salesforce.com/services/apexrest/Contact/003Dn0000074ZE2IAM
    @HttpGet 
    global static Contact getContact(){
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id contactId = endpoint.substring(lastIndex+1);
        Contact cnt =[SELECT FirstName, LastName, Title, Email, Department FROM Contact WHERE Id = : contactId];
        return cnt;
    } 
    
    @HttpPost 
    global static Id postContact(String firstName, String lastName, String title, String email, String department){
        Contact cnt = new Contact();
        cnt.FirstName = firstName;
        cnt.LastName = lastName;
        cnt.Title = title;
        cnt.Email = email;
        cnt.Department = department;
        insert cnt;
        return cnt.Id;
    }

    @HttpDelete 
    global static String deleteContact(){
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id cntId = endpoint.substring(lastIndex+1);
        try {
            Contact cnt = [SELECT Id FROM Contact Where Id = :cntId];
            delete cnt;
        } catch (Exception ex) {
            return 'Failed';        
        }
        //We made our success message
        RestContext.response.statusCode = 204;
        return 'Successfull';        
    }

    @HttpPut 
    global static Contact putContact(){
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Contact cnt = (Contact)JSON.deserialize(body, Contact.class);
        upsert cnt;
        return cnt;
    }

    @HttpPatch 
    global static Contact patchContact(){
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Contact cnt = (Contact)JSON.deserialize(body, Contact.class);
        update cnt;
        Contact updatedCnt = [SELECT Id, FirstName, LastName, Title, Email, Department FROM Contact WHERE Id = :cnt.Id];
        return updatedCnt;
    }
}