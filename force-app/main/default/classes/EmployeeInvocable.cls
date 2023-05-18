public with sharing class EmployeeInvocable {
    @InvocableMethod (label= 'Send Employees Information'
    description = 'Post the newly created employee records into vendor system'
    category = 'Employee')
    public static void sendEmployee(List<Id> employeeIds) {
        for (Id EmployeesId : employeeIds) {  
            RestCallouts.postEmployees(EmployeesId) ;        
        }
    }
}