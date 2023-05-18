public with sharing class RestCalloutsWeek1 {
    public static HttpResponse getCovidInfo() {
        //Endpoint: https://api.covidtracking.com/v1/us/current.json
        //Http Method: GET
        //1. Preapare HTTPRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.covidtracking.com/v1/us/current.json');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        if (response.getStatusCode() == 200) {
            String jsonString = response.getBody();
            //Convert json String into Wrapper
            List<CovidWrapper> wrapper = (List<CovidWrapper>)JSON.deserialize(jsonString, List<CovidWrapper>.class);
            
            //Convert Wrapper into sObject record
            List<Covid_Info__c> covidInfo = [SELECT Name, Received_Date__c,Positive__c,Negative__c,Pending__c FROM Covid_Info__c WHERE Received_Date__c = TODAY];
            if (covidInfo.isEmpty()) {
                Covid_Info__c covid = new Covid_Info__c();
                covid.name = String.valueOf(wrapper[0].states);
                covid.Positive__c = wrapper[0].positive;
                covid.Negative__c = wrapper[0].negative;
                covid.Pending__c = wrapper[0].pending;
                covid.Received_Date__c = Date.today();
                insert covid;        
            }else{
                covidInfo[0].name = String.valueOf(wrapper[0].states);
                covidInfo[0].Positive__c = wrapper[0].positive;
                covidInfo[0].Negative__c = wrapper[0].negative;
                covidInfo[0].Pending__c = wrapper[0].pending;
                update covidInfo[0];
            }        
        }
        return response;
    }
    public static HttpResponse postPosts(){

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/posts');
        request.setMethod('POST');
        //set Json body
        Post__c post = [SELECT Name, User_ID__c, Title__c, Body__c FROM Post__c LIMIT 1];
        PostWrapper wrapper = new PostWrapper();
        wrapper.user_id = Integer.valueof(post.User_ID__c);
        wrapper.title = post.Title__c;
        wrapper.body = post.Body__c;
        String body = JSON.serialize(wrapper);
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer 1d437277adf8bc549898d16707588b585510c47c40a7210032a5af5464eac1c3');

        Http http = new Http();

        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200 || response.getStatusCode() == 201) {
            system.debug('Record has been sent successfully'); 
            system.debug(response.getBody());     
        } else {
            system.debug('An error occurred');
            system.debug(response.getBody());   
        }  
        return response;  
    }
}