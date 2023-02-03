public class SOQL_Turkish_Assignment {
    public static void accountSOQL(){
        List<Account>listAcc = [select id, name, industry from account where industry = 'Education'];
        system.debug('List size is: ' + listAcc.size());
        system.debug(listAcc);
    }
}