trigger AccountTrial on Account (after update) {
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            AccountTrialTriggerHelper.afterUpdate(Trigger.newMap);
        }
    }
}