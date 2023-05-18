@isTest 
public with sharing class LeadManagerTest {
    @TestSetup
    private static void makeData(){
        List<Lead> leads = new List<Lead>();
        for (Integer i = 01; i <= 2; i++) {
            Lead ld = new Lead(FirstName ='Test', LastName='Testing' +i);
            ld.Company = 'ABC';
            ld.LeadSource = 'Web';
            leads.add(ld);        
        }
        insert leads;        
    }
    @isTest 
    private static void getLeadTest(){
        Test.startTest();
        // 1. Prepare RestRequest - wrap all the data in it 
        Lead ld = [SELECT Id, FirstName, LastName, Company, LeadSource FROM Lead LIMIT 1];
        String endpoint = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Lead/' + ld.Id;
        RestRequest request = new Restrequest();
        request.requestURI = endpoint;
        request.httpMethod = 'GET';

        // 2. Preapare Restcontext
        RestContext.request = request;

        // 3. Make callout
        Lead led = LeadManager.getLead();

        // 4. Perform assertion 
        Assert.areEqual(ld.FirstName, led.FirstName);
        Assert.areEqual(ld.Company, led.Company);
        Test.stopTest();
    }
    @isTest 
    private static void postLeadTest(){
        Test.startTest();
        // 3. Make callout
        Id ldId = LeadManager.postLead('Test', 'Testing', 'Def', 'Tester', 'Phone Inquiry', 'test@test.com', '1234567890');

        // 4. Perform assertion 
        Assert.isNotNull(ldId);
        Test.stopTest();        
    }
    @isTest 
    private static void deleteLeadTest(){
        Test.startTest();
        // 1. Prepare RestRequest - wrap all the data in it
        Lead ld = [SELECT Id FROM Lead LIMIT 1];
        String endpoint = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Lead/' + ld.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'DELETE';

        // 2. Preapare Restcontext
        RestContext.request = request;

        // 3. Make callout
        String status = LeadManager.deleteLead();

        // 4. Perform assertion (Success)
        Assert.areEqual('Success', status);
        Test.stopTest();
    }
    @isTest 
    private static void deleteLeadFailTest(){
        Test.startTest();
        // 1. Prepare RestRequest - wrap all the data in it
        Lead ld = [SELECT Id FROM Lead LIMIT 1];
        String endpoint = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Lead/' + ld.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'DELETE';

        // 2. Preapare Restcontext
        RestContext.request = request;

        // 3. Make callout
        String status = LeadManager.deleteLead();
        String status1 = LeadManager.deleteLead();

        // 4. Perform assertion (Fail)
        Assert.areEqual('Failed', status1);
        Test.stopTest();
    }
    @isTest 
    private static void putLeadTest(){
        Test.startTest();
        // 1. Prepare RestRequest - wrap all the data in it
           //Step 1
           Lead ld = new Lead(FirstName = 'How', LastName = 'Are', Company = 'You', LeadSource = 'Other');
           String body = JSON.serialize(ld);
           //Step 2
           RestRequest request = new RestRequest();
           request.requestBody = Blob.valueOf(body);
           request.httpMethod = 'PUT';

        // 2. Preapare Restcontext
        RestContext.request = request;

        // 3. Make callout
        Lead newLd = LeadManager.putLead();

        // 4. Perform assertion 
        Assert.isNotNull(newLd.Id);
        Assert.areEqual(ld.FirstName, newLd.FirstName);
        Assert.areEqual(ld.Company, newLd.Company);
        Test.stopTest();               
    }
    @isTest 
    private static void patchLeadTest(){
        Test.startTest();
        // 1. Prepare RestRequest - wrap all the data in it
           //Step 1
           Lead ld = [SELECT Id, FirstName, LastName, Company, Title, LeadSource FROM Lead LIMIT 1];
           ld.Title = 'GHF';
           ld.LeadSource = 'Web';
           String body = JSON.serialize(ld);
           //Step 2
           RestRequest request = new RestRequest();
           request.requestBody = Blob.valueOf(body);
           request.httpMethod = 'PATCH';

        // 2. Preapare Restcontext
        RestContext.request = request;

        // 3. Make callout
        Lead updatedLd = LeadManager.patchLead();

        // 4. Perform assertion
        Assert.areEqual('GHF', updatedLd.Title);
        Assert.areEqual('Web', updatedLd.LeadSource);
        Test.stopTest();
    }
}