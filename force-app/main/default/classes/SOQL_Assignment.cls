public class SOQL_Assignment {
    public static void soql_WhereClause(){
        List<contact>lstContact =[select id, lastName from contact where lastName like '%A%'];
        system.debug(lstContact);
        system.debug('Contact list size is==> ' + lstContact.size());
    }
    public static void soql_Formethod(){
        List<contact> lstContact =[select lastName, phone from contact];
          for(contact eachContact : lstContact) {
            string cLastName = eachContact.lastName;
            string cPhone = eachContact.phone;
            system.debug('Contact last name is: ' + cLastName + ' and phone number is: ' + cPhone);   
        }

    }
}