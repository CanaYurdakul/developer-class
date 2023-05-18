//What is JSON Format
//{
//    "Name" : "ABC Pvt Ltd",
//    "Type" : "Consulting",
//    "Industry" : "Education",
//    "AnnualRevenue" : 2000000,
//    "Established" : 2000
//}

// Get an account record, convert that into JSON Format
Account acc = [SELECT Name, Type, Industry, AnnualRevenue FROM Account WHERE Type != null AND Industry != null AND AnnualRevenue != null LIMIT 1];
String jsonString = JSON.serialize(acc);
system.debug(jsonString);

//get 5 account records, convert them into json format 
List<Account> accounts = [sELECT Id, Name, type, Industry, AnnualRevenue FROM Account WHERE Type != null AND Industry != null AND AnnualRevenue != null LIMIT 5];
String jsonString = JSON.serialize(accounts);
system.debug(jsonString);

//Get 1 opportunity record convert that into json format 

//Opportunity opp = [SELECT Id, Name, Type, StageName, Amount 
//                   FROM Opportunity 
//                   WHERE Type != null 
//                   AND StageName != 
//                   AND Amount != null 
//                   LIMIT 1];
//String jsonString = JSON.serialize(opp);
//system.debug(jsonString);

Opportunity acc = [SELECT Id, Name, Type, StageName, Amount FROM Opportunity WHERE Type != null AND StageName != null AND Amount != null LIMIT 1];
String jsonString = JSON.serialize(acc);
system.debug(jsonString);

//Get top 10 Opp based on amount convert them into json format
List<Opportunity> acc = [SELECT Id, Name, Type, StageName, Amount FROM Opportunity WHERE  Amount != null ORDER BY Amount DESC LIMIT 10];
String jsonString = JSON.serialize(acc);
system.debug(jsonString);

//Test REST Callouts 
RestCallouts.getAnimals();
RestCallouts.getAirlines();
RestCallouts.getEmployees();
RestCallouts.getCaseInfo();
RestCallouts.postAnimal();

SoapCallouts.getParksByCountry('United States');
SoapCallouts.doAddCallout(5,6);
SoapCallouts.doMultiplyCallout(13,15);


