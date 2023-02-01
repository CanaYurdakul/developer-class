public class DatetimeMethodsDemo {
    public void calculateAgeInMonths(){
        date birthDate = date.newInstance(1984, 10, 16);
        date todaydate = date.today();

        integer ageInMonths = birthDate.monthsBetween (todayDate);
        system.debug('My age in months is ==> ' + ageInMonths);

        integer ageInDays = birthDate.daysBetween (todayDate);
        system.debug('My age in days ==> ' + ageInDays);
    }
    public void printSubscriptionEndDate(){
        Date subStartDate = date.today();

        Date subEndDate = subStartDate.addDays (1000);
        system.debug('subscription end date is ==> ' + subEndDate);

        integer endDateYear = subEnddate.year();
        system.debug('year of end date ' + endDateYear);

        integer endDateMonth = subEndDate.month();
        system.debug('month of end date ' + endDateMonth);
    }
    public void printOfferEndDate(){
        datetime offerStart = datetime.now();
        datetime offerEnd = offerStart.addHours(51);

        system.debug('offer end datetime is ' + offerEnd);

        Date offerEndDate = offerEnd.date();
        system.debug('offer enddate is ' + offerEndDate);
    }
    public void birthDateInMs(){
        datetime birthDT = datetime.newInstance (1984, 10, 16, 16, 50, 00);
        long birthDateMS = birthDT.getTime();
        system.debug ('My birth datetime in milliseconds ==> ' + birthDateMS);
    }

}