public class MyCity {
    public void cityInformation(){
        string country = 'Indonesia';
        string city = 'Bali';
        string combination = 'The country I want to go ==> ' +country + ' and the city I want to go ==> ' + city;
        system.debug(combination);

        dateTime canada = Datetime.newInstance(1867, 07, 01);
        system.debug('Canada was founded in==> ' + canada);

        time sunrise = time.newInstance(07, 50, 00, 00);
        system.debug('Sunrise time is==> ' + sunrise);

        dateTime today = date.today();
        dateTime before36 = today.addMonths(-36);
        system.debug('Todays date is ==> ' + today + ' and 36 months before date was ==> ' + before36);
    }
    public void stringMethod(){
        string mission ='I am a Salesforce Developer';

        boolean force = mission.contains('force');
        system.debug('Is there any force word in the sentence?: ' + force );

        integer lentOfStr = mission.length();
        system.debug('The number of characters in the sentence is==> ' +lentOfStr);

        string upper = mission.toUpperCase();
        system.debug('New version of the sentence is: '+ upper);
    }
    public void dateMethod(){
        date today = date.today();
        system.debug('Today date is: ' + today);

        dateTime now = dateTime.now();
        system.debug('Todays date and time is==> ' + now); 

        dateTime after = now.addHours(50);
        system.debug('After 50 hours ==> ' + after);
    }
    public string favoriteCafe;
    public string favoritePark;
    public string favoriteMall;
    public string favoriteStore;
    

    public string myFavoriteLocations(string city) {
        system.debug('In the city where I live my favorite cafe is ' + favoriteCafe + ' and my favorite park is ' + favoritePark + ' I usually shop ' + favoriteMall + ' and my favorite store is ' + favoriteStore);
        return city;
        
    }
}