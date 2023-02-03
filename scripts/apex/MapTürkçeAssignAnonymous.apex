map<Integer,String>platesList = new map<Integer,String>();
    platesList.put(34, 'İstanbul' );
    platesList.put(16, 'Bursa');
    platesList.put(35, 'İzmir');
    platesList.put(42, 'Konya');
    platesList.put(27, 'Gaziantep');
    system.debug(platesList);

    Boolean containIst = platesList.containsKey(34);
    system.debug('Is the map contains İstanbul==> ' + containİst);

    Boolean containTrb = platesList.containsKey(61);
    system.debug('Is the map contains Trabzon==> ' + containTrb);

    system.debug('Map elements size is ==> ' + platesList.size());

    platesList.remove(16);
    system.debug('Without Bursa == ' + platesList);

    Set<Integer>cityPlates = platesList.keySet();
    system.debug(cityPlates);
    List<String>cityNames = platesList.values();
    system.debug(cityNames);

    for (integer eachPlate : cityPlates){
        string printAll = 'Plate number is : ' + eachPlate;
        string eachValue = platesList.get(eachPlate);
        printAll += ' , and city is : ' + eachValue;
        system.debug(printAll);
    }
 
