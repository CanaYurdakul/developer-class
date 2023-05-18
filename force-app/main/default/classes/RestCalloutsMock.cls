public with sharing class RestCalloutsMock implements HttpCalloutMock {
    
    public HttpResponse respond(HttpRequest request){
        //Prepare Fake Response for getAnimals
        if (request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/animals' && request.getMethod() == 'GET') {
            //Fake response preparation
            HttpResponse response = new HttpResponse();
            response.setStatus('OK');
            response.setStatusCode(200);
            String body = '{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}';
            response.setBody(body);
            return response;       
        }
        //fake response for getAirlines
        else if(request.getEndpoint() == 'https://api.instantwebtools.net/v1/airlines/1' && request.getMethod() == 'GET'){
            //fake response preparation
            HttpResponse response = new HttpResponse();
            response.setStatus('OK');
            response.setStatusCode(200);
            String body = '{"id":1,"name":"Quatar Airways","country":"Quatar","logo":"https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/300px-Qatar_Airways_Logo.svg.png","slogan":"Going Places Together","head_quaters":"Qatar Airways Towers, Doha, Qatar","website":"www.qatarairways.com","established":"1994"}';
            response.setBody(body);
            return response;
        }  
        //Fake response for postAirlines
        else if(request.getEndpoint() == 'https://api.instantwebtools.net/v1/airlines' && request.getMethod() == 'POST'){
            //fake response preparation
            HttpResponse response = new HttpResponse();
            response.setStatus('OK');
            response.setStatusCode(200);
            return response;       
        }   
        //Fake response for get Employees
        else if (request.getEndpoint() == 'https://api.onlinewebtutorblog.com/employees'&& request.getMethod() == 'GET') {
            //fake response preparation
            HttpResponse response = new HttpResponse();
            response.setStatus('OK');
            response.setStatusCode(200);
            String body = '{"error":0,"msg":"data found","data":[{"id":1,"username":"ebahringer","name":"Braulio Luettgen","email":"kaela.turner@example.net","gender":"Female","designation":"Mean Stack Developer","phone_number":"781.322.7616","complete_address":"298 Edythe Harbors Suite 697 Lake Mathiasburgh, MN 28564-6386"},{"id":2,"username":"moore.samanta","name":"Christian Kessler","email":"summer.koepp@example.com","gender":"Male","designation":"Freelancer","phone_number":"509-549-9565","complete_address":"8947 Howell Mountains South Kavon, VT 89670-8443"}]}';
            response.setBody(body);
            return response;
        }  
        //Fake response for get CaseInfo
        else if (request.getEndpoint() == 'callout:NC_PRACTICEORG/services/apexrest/Case/500Dn000004n5d0IAA' && request.getMethod() == 'GET') {
            //fake response preparation
            HttpResponse response = new HttpResponse();
            response.setStatus('OK');
            response.setStatusCode(200);
            String body = '{"attributes":{"type":"Case","url":"/services/data/v57.0/sobjects/Case/500Dn000004n5d0IAA"},"Id":"500Dn000004n5d0IAA","CaseNumber":"00001001","Subject":"Performance inadequate for second consecutive week","Type":"Electrical","Priority":"High","Status":"Closed"}';
            response.setBody(body);
            return response;        
        }  
        //Fake response fot post Animal 
        else if (request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/animals' && request.getMethod() == 'POST') {
            //fake response preparation
            HttpResponse response = new HttpResponse();
            response.setStatus('Created');
            response.setStatusCode(201);
            String body = '{"animals":["majestic badger","fluffy bunny","scary bear","chicken","mighty moose"]}';
            response.setBody(body);
            return response;        
        }
        return null;
    }
}