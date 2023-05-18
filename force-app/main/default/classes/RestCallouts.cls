public with sharing class RestCallouts {

    //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Http Method: GET
    public static HttpResponse getAnimals(){
        //1. Preapare HTTPRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        system.debug(response.getStatus());
        system.debug(response.getStatusCode());
        system.debug(response.getBody());
        return response;
    }

    //Endpoint: https://api.instantwebtools.net/v1/airlines/1
    //Http Method: GET
    public static HttpResponse getAirlines(){
        //1. Preapare HTTPRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines/1');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            //Convert json string into wrapper
            AirlinesWrapper wrapper = (AirlinesWrapper)JSON.deserialize(jsonString, AirlinesWrapper.class); 

            //Convert wrapper into sObject record
            Airlines__c airline = new Airlines__c();
            airline.Name = String.valueOf(wrapper.id);
            airline.Name__c = wrapper.name;
            airline.Country__c = wrapper.country;
            airline.LogoURL__c = wrapper.logo;
            airline.Slogan__c = wrapper.slogan;
            airline.HeadQuaters__c = wrapper.head_quaters;
            airline.Website__c = wrapper.website;
            airline.Established__c = wrapper.established;

            //Create airlines record
            try{
                insert airline;
            }catch(Exception ex){
                system.debug(ex.getMessage());
            }
        }else{
            system.debug(response.getStatus());
            system.debug(response.getStatusCode());
            system.debug(response.getBody());
        }
        return response;
    }

    //Endpoint: https://api.onlinewebtutorblog.com/employees
    //Http Method: GET
    public static HttpResponse getEmployees(){
        //1. Preapare HTTPRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            //Convert json string into wrapper
            EmployeeWrapper empWrapper = (EmployeeWrapper)JSON.deserialize(jsonString, EmployeeWrapper.class); 
            List<EmployeeWrapper.Employee> employees = empWrapper.data;

            //Convert wrapper into sObject record
            List<Employee__c> emps = new List<Employee__c>();
            for(EmployeeWrapper.Employee empWrap : employees){
                Employee__c emp = new Employee__c();
                emp.Name = String.valueOf(empWrap.id);
                emp.UserName__c = empWrap.username;
                emp.Name__c = empWrap.name;
                emp.Email__c = empWrap.email;
                emp.Gender__c = empWrap.gender;
                emp.Designation__c = empWrap.designation;
                emp.Phone_Number__c = empWrap.phone_number;
                emp.Complete_Address__c = empWrap.complete_address;
                emps.add(emp);
            }
            //Create employee record
            try{
                insert emps;
            }catch(Exception ex){
                system.debug(ex.getMessage());
            }
        }else{
            system.debug(response.getStatus());
            system.debug(response.getStatusCode());
            system.debug(response.getBody());
        }
        return response;
    }

    //Endpoint: https://wise-unicorn-f1q2sq-dev-ed.trailblaze.my.salesforce.com/services/apexrest/Case/500Dn000004n5dFIAQ
    //Http Method: GET
    public static HttpResponse getCaseInfo(){
        //1. Preapare HTTPRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:NC_PRACTICEORG/services/apexrest/Case/500Dn000004n5d0IAA');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        system.debug(response.getStatus());
        system.debug(response.getStatusCode());
        system.debug(response.getBody());
        return response;
    }

    //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Http Method: POST
    public static HttpResponse postAnimal(){
        //1. Preapare HTTPRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        //Set Json body
        request.setBody('{"name":"mighty moose"}');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);


        //4. Process the response
        system.debug(response.getStatus());
        system.debug(response.getStatusCode());
        system.debug(response.getBody());
        return response;
    }

    //Endpoint: https://api.instantwebtools.net/v1/airlines
    //Http Method: POST
    @Future(callout=true)
    public static void postAirlines(Id airlineId) {
        //1. Preapare HTTPRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines');
        request.setMethod('POST');
        //Set Json body
        Airlines__c airline = [SELECT Name, Name__c, Country__c, LogoURL__c, Slogan__c, HeadQuaters__c, Website__c, Established__c FROM Airlines__c WHERE Id = :airlineId];
        AirlinesWrapper wrapper = new AirlinesWrapper();
        wrapper.country = airline.Country__c;
        wrapper.logo = airline.LogoURL__c;
        wrapper.slogan = airline.Slogan__c;
        wrapper.head_quaters = airline.HeadQuaters__c;
        wrapper.website = airline.Website__c;
        wrapper.established = airline.Established__c;
        wrapper.name = airline.Name__c;
        String body = JSON.serialize(wrapper);
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        if (response.getStatusCode() == 200 || response.getStatusCode() == 201) {
            system.debug('Data has been sent successfully!');    
        }else{
            system.debug(response.getBody());
        }
    }

    //Endpoint: https://api.onlinewebtutorblog.com/employees
    //Http Method: POST
    @Future(callout=true)
    public static void postEmployees(Id EmployeesId){
        //1. Preapare HTTPRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('POST');
        //Set Json body
        Employee__c employee = [SELECT Name, UserName__c, Name__c, Email__c, Gender__c, Designation__c, Phone_Number__c, Complete_Address__c, Integration_Status__c FROM Employee__c WHERE Id = : EmployeesId];
        EmployeeWrapper.Employee emp = new EmployeeWrapper.Employee();
        emp.username = employee.UserName__c;
        emp.name = employee.Name__c;
        emp.email = employee.Email__c;
        emp.gender = employee.Gender__c;
        emp.designation = employee.Designation__c;
        emp.phone_number = employee.Phone_Number__c;
        emp.complete_address = employee.Complete_Address__c;
        String body= JSON.serialize(emp);
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        employee.Integration_Status__c = response.getBody();
        update employee;
    }
}