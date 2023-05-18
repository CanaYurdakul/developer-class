List<Account> listAcc = [SELECT Id, Name FROM Account LIMIT 10];
ContactQueableApex cq = new ContactQueableApex(listAcc);
id jobId = system.enqueueJob(cq);
