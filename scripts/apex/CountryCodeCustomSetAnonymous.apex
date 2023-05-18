Map<string, country_code__C> countryCodes = country_code__c.getAll();
system.debug('countryCode map ' + countryCodes);

for (string eachName : countryCodes.keySet()) {
    country_code__c eachRecord = countryCodes.get(eachName);
    system.debug('country is ' + eachName + ', its code is ' + eachRecord.code__c);    
}

//if we want to get just one value
country_code__c ccCanada = country_code__c.getInstance('Canada');
system.debug(ccCanada);
system.debug('ccCanada code ' + ccCanada.code__c);

country_code__c ccIndia = country_code__c.getInstance('India');
system.debug(ccIndia);
system.debug('ccIndia code ' + ccIndia.code__c);