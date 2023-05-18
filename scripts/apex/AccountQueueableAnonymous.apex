List<account> listAcc = [SELECT id, name FROM account];
AccountsQueueable aq = new AccountsQueueable(listAcc);
id jobId = system.enqueueJob(aq);

List<account> listAcc2 = [SELECT id, name FROM account WHERE name LIKE '%--SI'];
AccountsQueueable2 aq2 = new AccountsQueueable2(listAcc2);
id jobId2 = system.enqueueJob(aq2);