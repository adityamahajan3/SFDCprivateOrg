public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds) {
        // Aggregate query to efficiently count Contacts per Account
        List<AggregateResult> results = Database.query('SELECT AccountId, COUNT(Id) contactCount FROM Contact WHERE AccountId IN :accountIds GROUP BY AccountId');

        // Prepare Accounts for update
        List<Account> accountsToUpdate = new List<Account>();
        
        for (AggregateResult ar : results) {
            Account acc = new Account(
                Id = (Id)ar.get('AccountId'),
                Number_Of_Contacts__c = (Integer)ar.get('contactCount')
            );
            accountsToUpdate.add(acc);
        }
        update accountsToUpdate;
    }
}