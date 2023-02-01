date today = date.today();
date marie = date.newInstance(1867, 07, 07);
system.debug('Todays date is ==> ' + today + ' Marie Curies birthdate is==> ' + marie);

integer difference = marie.daysBetween(today);
integer daydif = difference / 365;
system.debug('The difference between days==> ' + daydif);

integer difference1 = marie.monthsBetween(today);
integer monthdif = difference1 / 12;
system.debug('The difference between months==> ' + monthdif);

integer year = today.year();
integer mariey = marie.year();
integer difference2 = year - mariey;
system.debug('The difference between years ==> ' + difference2);

system.debug('Is Marie Curies birthdate leap year? ==> ' + date.isLeapYear(1867));
