public class ScheduleBatchContactUpdate implements Schedulable{
    public void execute (SchedulableContext sc){
        BatchContactUpdate bc = new BatchContactUpdate();
        id jobId = Database.executeBatch(bc, 50);
    }
}