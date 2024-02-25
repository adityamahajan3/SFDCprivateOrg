global class BatchClassEg implements Database.Batchable<sObject>, Schedulable {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Query for accounts with a description length over 500 characters
        return Database.getQueryLocator([SELECT Id,name FROM Account]);
    }
        
    global void execute(Database.BatchableContext BC, List<Account> acc) {
        // 1 execute method for executable context
    }

    global void execute(SchedulableContext SC) {
        // 1 execute method for Schedulable context
    }
        
    global void finish(Database.BatchableContext BC) {
        //can call another class and the method inside it(even if its synchronous)
        //can send emails after our asynchronous BatchClassEg finishes execution
    }
}
/*
BatchClassEg bce = new BatchClassEg();
Database.executeBatch(bce,Batches);
*/