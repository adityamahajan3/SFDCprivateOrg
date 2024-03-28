public class Mar27BatchClass implements Database.Batchable<Account>{
    public Iterable<Account> start(Database.BatchableContext info){
        return new Mar27CustomIterable();
    }
    public void execute(Database.BatchableContext info, List<Account> scope){
        List<Account> accsToUpdate = new List<Account>();
        for(Account acc : scope){
            acc.Name = acc.Name + ' -changed';
            accsToUpdate.add(acc);
        }
        update accsToUpdate;
    }
    public void finish(Database.BatchableContext info){
    }
}
/*
Mar27BatchClass M = new Mar27BatchClass();
Database.executeBatch(M,1);
*/