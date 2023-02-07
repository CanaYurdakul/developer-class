public class TurkishAssignmentDML {
   public static void dmlInsert(){
    List<Account>AccountList = new List<Account>();
    account assign1 = new account();
    assign1.Name = 'Assignment 1';
    assign1.Phone = '9876543';
    assign1.Site = 'Branch';
    assign1.Website = 'www.assignment1.com';
    AccountList.add(assign1);

    account assign2 = new account();
    assign2.Name= 'Assignment 2';
    assign2.Phone= '98765432';
    assign2.Site= 'Branch';
    assign2.Website = 'www.assignment2.com';
    AccountList.add(assign2);

    insert AccountList;
   } 
   public static void dmlUpdate(){
     List<Account>listAccount = [SELECT name, phone FROM Account WHERE name LIKE 'Assignment%'];
     for(account eachAccount : listAccount){
        eachAccount.Name += 'Updated';
        eachAccount.Phone= '123456789';
     }
     update listAccount;
   }
   public static void dmlMultipleOppInsert(){
    List<Opportunity>OppList = new List<Opportunity>();
     for(Integer i = 0; i < 149; i++){
        Opportunity opp = new Opportunity();
        opp.Name = 'Homework' +i;
        opp.Type = 'New Customer';
        opp.StageName = 'Qualification';
        opp.CloseDate = date.newInstance(2024, 02, 02);
        opp.Description = '149 records created';
        OppList.add(opp);
     }
       insert OppList;
   }
}