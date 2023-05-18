Map<string, emailDomain__mdt> emails = EmailDomain__mdt.getAll();
system.debug(emails);

EmailDomain__mdt gmail = EmailDomain__mdt.getInstance('gmail');
system.debug('gmail ==> ' + gmail);
