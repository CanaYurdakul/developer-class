@isTest 
public class Dml_AssignTest {
    @isTest 
    private static void testDml() {
        Dml_Assign.insert_Dml();
        list<account> accs = [SELECT id, name FROM account WHERE name = 'Cana Assignment'];   
        assert.areEqual('Cana Assignment', accs[0].Name);        
    }
    @isTest 
    private static void testUpdateDml() {
        Dml_Assign.updating_dml();
        Account updateAcc = [SELECT id, name FROM account LIMIT 1];
        assert.areEqual('Account Updated', updateAcc.Name);       
   }
}