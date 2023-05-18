MathPractice bns = new MathPractice();
bns.practiceFour(-50);
bns.practiceFour(30);
bns.practiceFour(100);
bns.practiceFour(300);
bns.practiceFour(750);

MathPractice rct = new MathPractice();
decimal aver = rct.practiceThree (555,278);
system.debug('The average of the numbers is ==> ' + aver);

decimal bmi1 = rct.practiceTwo (85.5,1.78);
system.debug('Body mass index is ==> ' + bmi1);

decimal pm1 = rct.practiceOne(12.58,15.88);
system.debug('Perimeter of rectangle is ==> ' + pm1);



RestCallouts.getCaseInfo();

