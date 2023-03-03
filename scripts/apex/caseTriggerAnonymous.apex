list<Case> newCases = new list<case>();
for (Integer i = 0; i  < 210; i++) {
    case c = new case();
    c.Subject = 'trigger case';
    c.Status = 'New';
    c.Origin = 'Web';
    c.Description = 'Resolve it now';
    newCases.add(c);   
}
insert newCases;

List<case> updateCases = [SELECT id, status FROM case WHERE status = 'Working'];
for (case eachCase : updateCases) {
    eachCase.Status = 'New';
   
}
update updateCases;