public class feb28MorningDeleteOldClosedLostOpp implements Database.Batchable<sObject>, Database.Stateful {
    
    public Integer recordsProcessed = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, Name, StageName, CreatedDate FROM Opportunity WHERE CreatedDate >= LAST_N_DAYS:60 AND StageName = 'Closed Lost']);
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> oppList) {
        Database.DeleteResult[] deleteResults = Database.delete(oppList, false);
        for (Database.DeleteResult dr : deleteResults) {
            if (dr.isSuccess()) {
                recordsProcessed++;
            }
        }
    }

    public void finish(Database.BatchableContext bc) {
        String toAddresses = 'adityajmahajan@gmail.com'; 
        String subject = 'Batch Completion: Old Closed Lost Opportunities'; 
        String body = 'Batch job processed ' + recordsProcessed + ' records.';
        EmailManager.sendMail(toAddresses, subject, body);      
    }
}
/*
feb28MorningDeleteOldClosedLostOpp b = new feb28MorningDeleteOldClosedLostOpp();
Database.executeBatch(b,10);
*/