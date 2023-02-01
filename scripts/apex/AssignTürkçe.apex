date birthDate = date.newInstance(1984, 10, 16);
system.debug('My birthdate is ==> ' + birthDate);

integer birthDay = birthDate.day();
integer birthmonth = birthDate.month();
integer birthyear = birthDate.year();
integer result = birthDay + birthmonth + birthyear;
system.debug('My birthdate: day, month and year total is ==> ' + result);