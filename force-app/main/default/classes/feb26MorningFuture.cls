public with sharing class feb26MorningFuture {
    @future
    public static void updateOpportunityCount(Set<Id> accountIds, Set<Id> userIds) {
        // Aggregate query to get counts for each Account inserted, updated or deleted
        Map<Id, Integer> accountCounts = new Map<Id, Integer>();
        List<AggregateResult> accResult = Database.query('SELECT AccountId, COUNT(Id) cnt FROM Opportunity WHERE AccountId IN :accountIds GROUP BY AccountId');
        for (AggregateResult aggregate : accResult) {
            accountCounts.put((Id) aggregate.get('AccountId'), (Integer) aggregate.get('cnt'));
        }

        // Aggregate query to get counts for each User inserted, updated or deleted
        Map<Id, Integer> userCounts = new Map<Id, Integer>();
        List<AggregateResult> userResult = Database.query('SELECT OwnerId, COUNT(Id) cnt FROM Opportunity WHERE OwnerId IN :userIds GROUP BY OwnerId');
        for (AggregateResult aggregate : userResult) {
            userCounts.put((Id) aggregate.get('OwnerId'), (Integer) aggregate.get('cnt'));
        }

        // Update Account and User records
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accId : accountIds) {
            Account accToUpdate = new Account(Id = accId);
    
            if (accountCounts.containsKey(accId)) {
                accToUpdate.Count_Of_opportunities__c = accountCounts.get(accId);
            } 
            else {
                accToUpdate.Count_Of_opportunities__c = 0;
            }
        accountsToUpdate.add(accToUpdate);
        }
        update accountsToUpdate;

        List<User> usersToUpdate = new List<User>();
        for (Id userId : userIds) {
            User userToUpdate = new User(Id = userId);
    
            if (userCounts.containsKey(userId)) {
                userToUpdate.Count_Of_opportunities__c = userCounts.get(userId);
            }
            else {
                userToUpdate.Count_Of_opportunities__c = 0;
            }
            usersToUpdate.add(userToUpdate);        }
        update usersToUpdate;
    }
}