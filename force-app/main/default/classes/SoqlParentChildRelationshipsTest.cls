@isTest 
public class SoqlParentChildRelationshipsTest {
    @TestSetup
    static void makeData(){
      Account acc = new account();
      acc.Name = 'Test test';

      Account acc2 = new account();
      acc2.Name = 'Test test2';

      Account acc3 = new account();
      acc3.Name = 'Test test3';

      List<account> AccList = new List<account>{acc, acc2, acc3};
      insert AccList;   
    }
    @istest 
    private static void testChild() {
      List<account> listAcc = [SELECT id, name FROM account];

      List<contact> conlist = new List<contact>();
      for (Integer i = 0; i < 300; i++) {
        contact c = new contact();
        c.LastName = 'Testing' + i;
        if (i < 100) {
          c.AccountId = listAcc[0].id;    
        }else if (i < 200) {
          c.AccountId = listAcc[1].id;    
        }else {
          c.AccountId = listAcc[2].id;
        }
        conlist.add(c);   
      }
      insert conList;

      test.startTest();
      SoqlParentChildRelationship.childToParent();
      test.stopTest();      
   }
   @isTest 
   private static void testParent() {

    List<account> listAcc = [SELECT id, name FROM account];
    for (account eachAcc : listAcc) {
      eachAcc.Name = 'Testing Testing';
    }
    update listAcc;

    List<contact> listCon = new List<contact>();    
    for (Integer i = 0; i < 300; i++) {
      Contact c = new Contact();
      c.LastName ='Testing';
      if (i < 100) {
        c.AccountId = listAcc[0].id;    
      }else if (i < 200) {
        c.AccountId = listAcc[1].id;     
      }else {
        c.AccountId = listAcc[2].id; 
      }
      listCon.add(c);
    }
    insert listCon;
    
    SoqlParentChildRelationship.parentToChild();  
   }
}