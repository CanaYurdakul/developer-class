list<String>listCity = new list<String>{'İstanbul','Madrid','Amsterdam','New York','Paris','Toronto'};
system.debug('Size of the list is: ' + listCity.size());
system.debug('The first element of the list is: ' + listCity.get(0));
system.debug('The last element of the list is: ' + listCity[4]);

Boolean containsIs = listCity.contains('İstanbul');
system.debug('Is İstanbul on the list? ' + containsIs);

Boolean containsRo = listCity.contains('Roma');
system.debug('Is Roma on the list? ' + containsRo);

for (string eachCity : listCity){
    system.debug('City ' + eachCity);
}

set<String>setCity = new set<String>();
setCity.addAll(listCity);
system.debug(setCity);

listCity.remove(3);
system.debug(listCity);

setCity.add('Antalya');
setCity.add('Londra');
system.debug(setCity);

system.debug('List City has ' + listCity.size() + ' elements and its elements==> ' + listCity + ' Set City has ' + setCity.size() + ' elements and its elements==> ' + setCity);

setCity.removeAll(setCity);
system.debug(setCity);
system.debug('Is set city list empty? ' + setCity.isEmpty());
