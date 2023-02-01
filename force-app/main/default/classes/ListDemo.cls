public class ListDemo {
    public static string candidateList(integer i) {
        List<string> listCandidates = new list <string>();
        listCandidates.add('Marc');
        listCandidates.add('Elon');
        listCandidates.add('Bill');
        listCandidates.add('Marc');
        system.debug('Candidates ==> ' + listCandidates);

        //string candidate = listCandidates[i];
        //return candidate;

        string candidate = '';
        if (i>=0 && i < listCandidates.size()) {
            candidate = listCandidates[i];
        } else {
            candidate = 'No value found. Try again later';
        }
        return candidate;
    }
    public static void randomIntegerList() {
        List<integer> listInteger = new List<integer>();
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);
        system.debug('Random integer list ==> ' + listInteger);
        integer index3value = listInteger.get(3);
        //OR
        integer index3value2 = listInteger[3];
        system.debug('Value at index 3 ==> ' + index3value);
        system.debug('Value at index 3 again ==> ' + index3value2);
    }
    public static void allCats(){
        List<cat> cats = new List<cat>();
        
        cat c1 = new Cat ('cinamon', 'brown');
        cat c2 = new Cat ('duman', 'dark gray');
        cat c3 = new Cat ();
        cats.add(c1);
        cats.add(c2);
        cats.add(c3);
        system.debug('Cats ==>' + cats);
        if (!cats.isEmpty()) {
            system.debug('Cat at 0 ' + cats[0]);
        }
    }
    public static void iterateList() {
        List<integer> listInteger = new List<integer>();    
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);

        for (integer eachInteger : listInteger) {
            system.debug(eachInteger); 
        }  
    }
}