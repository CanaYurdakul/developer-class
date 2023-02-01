public class Conditionclass_Assignment {
    public string ifclassmethod(integer monthInt){
        string outputMonth = 'Not a valid month';
        if (monthInt == 1){
            outputMonth = 'January';
        }else if (monthInt == 2){
            outputMonth = 'February';
        }else{
            outputMonth = 'Not a valid month';
        }
        return outputMonth; 
    }

    public string casemethod(string month){
        string outputQuarter = 'Enter a proper month name';
        if (month == 'January' || month =='February' || month =='March') {
            outputquarter = 'Quarter 1';
        }else {
            outputQuarter = 'Not a valid Quarter';
        }
    return outputQuarter;
    }
}