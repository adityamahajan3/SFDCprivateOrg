/**
 * @description       : 
 * @author            : aditya.mahajan@aethereus.com
 * @group             : 
 * @last modified on  : 04-10-2024
 * @last modified by  : aditya.mahajan@aethereus.com
**/
trigger OpportunityTrigger on Opportunity (before update, before delete, after update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){

        }
        if(Trigger.isUpdate){
            OpportunityTriggerHandler.beforeUpdate(Trigger.newMap, Trigger.oldMap);
        }
        if(Trigger.isDelete){
            OpportunityTriggerHandler.beforeDelete(Trigger.old);
        }
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert){
            //feb26MorningSync.updateOpportunityCountOnAccount(Trigger.new);
            //feb26MorningSync.updateOpportunityCountOnUser(Trigger.new);
            OpportunityTriggerHandler.afterinsert(Trigger.newMap,Trigger.oldMap);
        }
        if(Trigger.isUpdate) {
            //feb26MorningSync.updateOpportunityCountOnAccount(Trigger.new);
            //feb26MorningSync.updateOpportunityCountOnUser(Trigger.new);
            OpportunityTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap, Trigger.newMap);
        }
        if (Trigger.isDelete) {
            //feb26MorningSync.updateOpportunityCountOnAccount(Trigger.old);
            //feb26MorningSync.updateOpportunityCountOnUser(Trigger.old);
        }
        if(Trigger.isUndelete){

        }
    }
    
/*
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
    */
}