public class Mar7UpdateAllOppMonthly implements Database.Batchable<sObject>, Schedulable {

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id FROM Opportunity'); 
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        List<Opportunity> oppsToUpdate = (List<Opportunity>) scope;
        for (Opportunity opp : oppsToUpdate) {
            opp.Description = 'Updated by batch job'; 
        }
        update oppsToUpdate; 
    }

    public void finish(Database.BatchableContext BC) {
        
    }

    public void execute(SchedulableContext sc) {
        Database.executeBatch(this, 200);
    }
}

/*
String cronExp = '0 0 10 1 * ?'; // Run on the 1st of every month at 10 AM
Mar7UpdateAllOppMonthly m = new Mar7UpdateAllOppMonthly();
System.schedule('Opportunity Monthly Update', cronExp, m);
*/