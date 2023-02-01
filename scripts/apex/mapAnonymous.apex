map<string, string> mapCountryCurrency = new map<string, string>();
mapCountryCurrency.put('USA', 'Dollar');
mapCountryCurrency.put('France', 'Euro');
mapCountryCurrency.put('Poland', 'Euro');
mapCountryCurrency.put('India', 'Rupees');
mapCountryCurrency.put('India', 'Rupee');
mapCountryCurrency.put('Türkiye', 'Lira');
mapCountryCurrency.put('El Salvador', 'Bitcoin');
system.debug('Map of country and its currency ==> ' + mapCountryCurrency);

string IndiaCurrency = mapCountryCurrency.get('India');
string TurkiyeCurrency = mapCountryCurrency.get('Türkiye');

system.debug('India currency is ' + IndiaCurrency);
system.debug('Türkiye currency is ' + TurkiyeCurrency);

Set<string> countrySet = mapCountryCurrency.keySet();
system.debug('Countries are ' + countrySet);

List<string> currencies = mapCountryCurrency.values();
system.debug('Currencies are ' + currencies);

Set<String> countries = mapCountryCurrency.keySet();
//for each loop on country set

for(string eachKey : countrySet){
    string printString = 'Country is ' + eachKey;
    string eachValue = mapCountryCurrency.get(eachKey);
    printString += ', its cureency is ' + eachValue;
    system.debug(printString);
    //system.debug('country is ' + eachKey + ' its currency is ' + eachValue);
}
