try{
    account a = new account();
    insert a;
}catch(DmlException dmlex){
    system.debug('dml went wrong');
    system.debug('dml ex message: ' + dmlex.getDmlMessage(0));
    system.debug('ex message ' + dmlex.getMessage());
}catch(Exception ex){
    system.debug('something went wrong buddy');
    system.debug('ex message ' + ex.getMessage());
    //this will give us error message.
    //which can be used to log, send email, throw same error to users. etc. 
}

system.debug('Apex is SIMPLE');