TurkishAssignmentDML.dmlMultipleOppInsert();
TurkishAssignmentDML.dmlUpdate();
TurkishAssignmentDML.dmlInsert();

delete[SELECT name, phone FROM Account WHERE name LIKE 'Assignment%'];
delete[SELECT name FROM opportunity WHERE name lIKE 'Homework%'];

Account acc = new Account();
acc.Name = 'Summer Fest LLC';
acc.ParentId = '001Dn00000B9NLlIAN';
acc.Type = 'Technology Partner';
acc.Rating = 'Hot';
acc.AnnualRevenue= 200000000;
insert acc; 

List<Contact>ListContact = new List<Contact>();
Contact cnt = new Contact();
cnt.LastName = 'Event Planner 1';
cnt.Phone = '+1 2345 7896';
cnt.AccountId = '001Dn00000HVQBGIA5';
ListContact.add(cnt);

Contact cnt1 = new Contact();
cnt1.LastName = 'Event Planner 2';
cnt1.Phone = '+1 2345 7896';
cnt1.AccountId = '001Dn00000HVQBGIA5';
ListContact.add(cnt1);

Contact cnt2 = new Contact();
cnt2.LastName = 'Event Planner 3';
cnt2.Phone = '+1 2345 7896';
cnt2.AccountId = '001Dn00000HVQBGIA5';
ListContact.add(cnt2);

insert ListContact;
