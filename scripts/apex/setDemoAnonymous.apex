Set<string> cities = new set<string>();
cities.add('Tokyo');
cities.add('Lisbon');
cities.add('Berlin');
cities.add('Nairobi');
cities.add('Tokyo');
cities.add('BERLIN');
cities.add('Nairobi');

set<string> CapCities = SetDemo.upperCaseSet(cities);
system.debug(capCities);




list<Integer>l1 = new list<Integer>();
l1.add(10);
l1.add(15);
l1.add(21);
l1.add(15);
l1.add(15);
set<Integer> s1 = SetDemo.setFromList(l1);
system.debug('l1 ' + l1);
system.debug('s1 ' + s1);

SetDemo.setFromList(listInt);
SetDemo.randomIntegerSet();
SetDemo.citySet();

