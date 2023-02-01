map<string, integer>marksObtainInMaths = new map<string, integer>();
marksObtainInMaths.put('0111CE112', 40);
marksObtainInMaths.put('0111CE102', 19);
marksObtainInMaths.put('0111CE100', 33);
marksObtainInMaths.put('0111CE098', 40);

Set<String>studentRollNumber = marksObtainInMaths.keySet();
system.debug('Student roll number ==> ' + studentRollNumber);

list<integer>marksObtain = marksObtainInMaths.values();
system.debug('Marks obtained ==> ' + marksObtain);

set<string>uniqueRollNumberSet = marksObtainInMaths.keySet();
list<integer>marksObtainList = marksObtainInMaths.values();
for(string eachRoll : uniqueRollNumberSet){
    integer eachNum = marksObtainInMaths.get(eachRoll);
    system.debug('Student roll number is ' + eachRoll + ' its mark is ' + eachNum);
    
    if(eachNum < 20){
        system.debug(eachRoll + ' is not qualified for next class');
    } 
}