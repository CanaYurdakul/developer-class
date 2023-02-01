public class Datetime_Assignment {
    public void diffofDate(){
        Date varTomorrowDate = date.newInstance(2023, 01, 15);
        Date varTodaysDate= date.newInstance(2023, 01, 14);
        Integer diffOfDays = varTodaysDate.daysBetween(varTomorrowDate);
        system.debug('The difference between the days is ' + diffOfDays);
    }
    public void timeCheck(){

    DateTime varTomorrowDateTime = Datetime.newInstance(2023, 01, 15, 07, 00, 00);
    DateTime var10DaysDateTime = Datetime.newInstanceGmt (2023, 01, 24, 09, 00, 00);
    long varDateTimeLong = 12339874361L;

    DateTime var7Days = varTomorrowDateTime.addDays(7);
    system.debug('Seven Days after tomorrow will be==> ' + var7Days);
    DateTime var10Days = var10DaysDateTime.addDays(10);
    system.debug('Ten Days after will be ==> ' + var10Days);  
}    
}