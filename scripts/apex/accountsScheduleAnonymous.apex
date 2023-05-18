string crn = '0 0 13 * * ?';

AccountsSchedule acs = new AccountsSchedule();
system.schedule('AccountsSchedule22', crn, acs);