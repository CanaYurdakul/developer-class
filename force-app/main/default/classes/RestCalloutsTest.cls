@isTest
public with sharing class RestCalloutsTest {
    
    @isTest
    private static void getAnimalsTest(){
        Test.startTest();
        //1.Set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2.Make Callout
        HttpResponse response = RestCallouts.getAnimals();

        //3.Perform assertion
        system.assertEquals(200, response.getStatusCode());
        system.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }

    @isTest 
    private static void getAirlinesTest(){
        Test.startTest();
        //1.Set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2.Make Callout
        HttpResponse response = RestCallouts.getAirlines();

        //3.Perform assertion
        system.assertEquals(200, response.getStatusCode());
        system.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }

    @isTest 
    private static void postAirlinesTest(){
        Test.startTest();
        //1.Set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2.Make Callout
        Airlines__c airlines = new Airlines__c();
        airlines.Name = '123456789987654321';
        airlines.Name__c = 'Turkish Airlines';
        airlines.Country__c = 'Turkiye';
        airlines.Established__c = '2023';
        airlines.Slogan__c = 'Widen Your World';
        airlines.LogoURL__c = 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.turkishairlines.com%2Fen-int%2[…]e=images&cd=vfe&ved=0CBAQjRxqFwoTCJjP4-zsqv4CFQAAAAAdAAAAABAE';
        insert airlines;

        //3.Perform assertion
        system.assert(airlines.Id != null);
        Test.stopTest();
    }
    @isTest 
    private static void getEmployeesTest(){
        Test.startTest();
        //1.Set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);
        
        //2.Make Callout
        HttpResponse response = RestCallouts.getEmployees();

        //3.Perform assertion
        system.assertEquals(200, response.getStatusCode());
        system.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }
    @isTest
    private static void getCaseInfoTest(){
        Test.startTest();
        //1.Set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2.Make Callout
        HttpResponse response = RestCallouts.getCaseInfo();

        //3.Perform assertion
        system.assertEquals(200, response.getStatusCode());
        system.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }
    @isTest 
    private static void postAnimalTest(){
      Test.startTest(); 
      //1.Set mock
      RestCalloutsMock mock = new RestCalloutsMock();
      Test.setMock(HttpCalloutMock.class, mock);

      //2.Make Callout
      HttpResponse response = RestCallouts.postAnimal();

      //3.Perform assertion
      system.assertEquals(201, response.getStatusCode());
      system.assertEquals('Created', response.getStatus());
      Test.stopTest();
    }
}