public class MyFirstBatchClass implements Database.Batchable<sObject> {
        public Database.QueryLocator start(Database.BatchableContext BC) {
            return Database.getQueryLocator([SELECT Id, LastName FROM Contact]);
        }
        public void execute(Database.BatchableContext BC, List<Contact> conList) {
            for (Contact c1 : conList) {
                String lName = '';
                c1.LastName = c1.LastName +' test';
                conList.add(c1);
            }
            update conList; // Update all the contacts
        }
        public void finish(Database.BatchableContext BC) {
            System.debug('Finished');
        }
}
/*
MyFirstBatchClass m = new MyFirstBatchClass();
Database.executeBatch(m,10);
*/