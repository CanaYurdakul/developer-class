List<Case> casesToDelete = [SELECT Id FROM Case WHERE Status = 'New'];
Database.delete(casesToDelete);


List<Contact> contactsToDelete = [SELECT Id FROM Contact WHERE Name = 'try to catch'];
delete contactsToDelete;
