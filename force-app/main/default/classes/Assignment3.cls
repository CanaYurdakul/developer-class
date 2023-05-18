public class Assignment3 {
    public void localString(){
        string localString = 'Thanks for the session on the string';

        integer lentOfStr = localString.length();
        system.debug('Length of the local string is ' + lentOfStr);

        string strCapital = localString.toUpperCase();
        system.debug('The capital string is ==> ' + strCapital);

        Boolean containsSession = localString.contains('session');
        system.debug('Local String contains==> ' + containsSession);

        Boolean containsSession1 = localString.contains('sessions');
        system.debug('Local String contains==> ' + containsSession1);

        Boolean containsSession3 = localString.containsIgnoreCase('SESSION');
        system.debug('Local String contains==> ' + containsSession3);

    }
}