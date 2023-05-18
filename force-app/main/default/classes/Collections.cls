public class Collections {
    public static string listAssignment(integer i) {
        i -= 1;
        List<string> lstMonth = new List<string>();
        lstMonth.add('January');
        lstMonth.add('February');
        lstMonth.add('March');
        lstMonth.add('April');
        lstMonth.add('May');
        lstMonth.add('June');
        lstMonth.add('July');
        lstMonth.add('August');
        lstMonth.add('September');
        lstMonth.add('October');
        lstMonth.add('November');
        lstMonth.add('December');   

        string outPutMonth='';
        if (i >= 0 && i < lstMonth.size()) {
            outPutMonth = lstMonth[i];
        } else {
            outPutMonth = 'Not a Valid Month!';
        }
        return outPutMonth;
    }
}