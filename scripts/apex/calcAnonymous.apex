Calculator c = new Calculator();
c.publicMessage();



date dtt = date.today();
boolean dttCheck = c.leapYearCheck(dtt);
system.debug('Today date is in leap year ?? ' + dttCheck);

integer sum2 = c.add(10,15,25);
system.debug('sum2 is ' + sum2);

integer x= 10;
integer y= 15;
integer sum1 = c.add(x, y);
system.debug('sum1 is ' + sum1);


string message = 'some new message to print';
string messageResult = c.printAndReturnMessage(message);
system.debug(messageResult);



//c.printAndReturnMessage('print this for batch 14');
string result = c.printAndReturnMessage('print this for batch 14');//this will also work. We ARE storing in one variable.
system.debug(result);


string m = 'print this now';
c.printNewMessage(m);
string msg = 'print this now too';
c.printNewMessage(msg);
c.printNewMessage('print this too buddy');
c.printAndReturnMessage();

