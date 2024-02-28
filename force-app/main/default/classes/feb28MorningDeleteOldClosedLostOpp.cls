public class feb28MorningDeleteOldClosedLostOpp implements Database.Batchable<sObject>, Database.Stateful {

    public Integer recordsProcessed = 0; 

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id FROM Opportunity WHERE IsClosed = true AND StageName = 'Closed Lost' AND CreatedDate < LAST_N_DAYS:60]);
    }

    public void execute(Database.BatchableContext BC, List<Opportunity> oppList) {
        Database.DeleteResult[] deleteResults = Database.delete(oppList, false);
        for (Database.DeleteResult dr : deleteResults) {
            if (dr.isSuccess()) {
                recordsProcessed++;
            }
        }
    }

    public void finish(Database.BatchableContext BC) {
        String toAddresses = 'adityajmahajan@gmail.com'; 
        String subject = 'Batch Completion: Old Closed Lost Opportunities'; 
        String body = 'Batch job processed ' + recordsProcessed + ' records.';
        EmailManager.sendMail(toAddresses, subject, body);
        System.debug('Done');

    }
}
/*
feb28MorningDeleteOldClosedLostOpp b = new feb28MorningDeleteOldClosedLostOpp();
Database.executeBatch(b,10);
*/