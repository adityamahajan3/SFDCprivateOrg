trigger opportunityTrigger on Opportunity (after insert, after update, after delete) {
/*
    //for synchronus method
    if (Trigger.isAfter) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            feb26MorningSync.updateOpportunityCountOnAccount(Trigger.new);
            feb26MorningSync.updateOpportunityCountOnUser(Trigger.new);
        } else if (Trigger.isDelete) {
            feb26MorningSync.updateOpportunityCountOnAccount(Trigger.old);
            feb26MorningSync.updateOpportunityCountOnUser(Trigger.old);
        }
    }
*/
// For Future Method
    Set<Id> accountIds = new Set<Id>();
    Set<Id> userIds = new Set<Id>();

    
    if (Trigger.isDelete) {
        // Call the future method to update counts after deletion
        for (Opportunity opp : Trigger.old) {
            accountIds.add(opp.AccountId);
            userIds.add(opp.OwnerId);
        }
    
        feb26MorningFuture.updateOpportunityCount(accountIds, userIds);
    } 
    else {
        // Call the future method to update counts after insert or update
        for (Opportunity opp : Trigger.new) {
            accountIds.add(opp.AccountId);
            userIds.add(opp.OwnerId);
        }
        feb26MorningFuture.updateOpportunityCount(accountIds, userIds);
    }
}