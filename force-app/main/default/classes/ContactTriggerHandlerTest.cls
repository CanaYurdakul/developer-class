@isTest 
public class ContactTriggerHandlerTest {
    @isTest 
    private static void testValidation() {
        contact c = new contact();
        c.LastName = 'test contact';
        c.LeadSource = 'Web';
        insert c;

        try {
            c.LeadSource = 'Phone';
            update c;
        } catch (Exception ex) {
            system.debug('ex message: ' + ex.getMessage());
            //assert here 
            //assert.isTrue(ex.getMessage().containsIgnoreCase('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
        }        
    }    
}