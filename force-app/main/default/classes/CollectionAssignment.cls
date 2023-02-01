public class CollectionAssignment {
    
    Set<String> countriesSet = new Set<String>{'India', 'Usa','Russia','Germany','Singapore', 'Japan'};   
        
    public void printLowerCaseSet() {
        Set<String> lowerCase = new Set <String>();
        for (string eachStr : countriesSet) {
            string newLower = eachStr.toLowerCase();
            lowerCase.add(newLower);
        }
        system.debug (lowerCase);  
    }
    public void printUpperCaseSet() {
        Set<String> upperCase = new Set <String>();
        for (string eachStr1 : countriesSet) {
            string newUpper = eachStr1.toUpperCase();
            upperCase.add(newUpper);
        }
        system.debug (upperCase);  
    }
}