trigger subscriptionTrigger on Subscription__c (before insert, before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert && Trigger.isUpdate){
            feb21evening.beforeinsertupdate(Trigger.new);
        }
    }
}
