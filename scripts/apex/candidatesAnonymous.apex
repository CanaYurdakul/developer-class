Candidates.companyName = 'SoftInnovas';

system.debug('O. company name ' + Candidates.companyName);
system.debug('count candidates ==> ' + candidates.countCandidates);

Candidates c1 = new Candidates();
Candidates.countCandidates++;
c1.Name = 'Jerry';
c1.Gender ='Male';
c1.printCandidate(); 
system.debug('1. company name ' + Candidates.companyName);

Candidates c2 = new Candidates();
Candidates.countCandidates++;
c2.Name = 'Elaine';
c2.Gender ='Female';
c2.printCandidate(); 
system.debug('2. company name ' + Candidates.companyName);

Candidates.companyName = 'Vandaley Industries';

Candidates c3 = new Candidates();
Candidates.countCandidates++;
c3.Name = 'George';
c3.Gender ='Male';
c3.printCandidate(); 
system.debug('3. company name ' + Candidates.companyName);

c1.printCandidate();
c2.printCandidate();
system.debug('end count candidates => ' + Candidates.countCandidates);

