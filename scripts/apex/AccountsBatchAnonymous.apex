AccountsBatch ab = new AccountsBatch();
Database.executeBatch(ab, 50);

RestCallouts.getCaseInfo();