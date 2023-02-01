public class SetDemo {
    public static void citySet() {
        Set<string> cities = new Set<string>(); 
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Nairobi');
        cities.add('Tokyo');
        cities.add('BERLIN');
        cities.add('Nairobi');

        system.debug('City set: ' + cities);
    }
    public static void randomIntegerSet() {
        Set<integer> intSet = new Set<integer>();
        intSet.add(10);
        intSet.add(15);
        intSet.add(21);
        intSet.add(15);
        intSet.add(15);
        intSet.add(15);
        system.debug('Set of integers ' + intSet); 
    }
    public static Set<Integer> setFromList(list<Integer>listInt){
        Set<Integer> returnSet = new Set<Integer>();
        returnSet.addAll(listInt);
        return returnSet;
    }
    public static set<string> upperCaseSet(set<string> setStr) {
        Set<string> upperSet = new Set<string>();
        
        for (string eachStr : setStr) {
            string tempStr = eachStr.toUpperCase();
            upperSet.add(tempStr);
        }
        return upperSet;
    }
}