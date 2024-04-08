trigger AccountTrigger on Account (after insert, after update, before delete) {
    if(Trigger.isBefore){
        if(Trigger.isDelete){
            //feb21morning.errorBeforeDeleting(Trigger.oldMap);
            AccountTriggerHandler.beforeDelete(Trigger.old,Trigger.oldMap);
        }
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            //AccountCreateChildContactTriggerHelper.createChildContact(Trigger.new);
            AccountTriggerHandler.afterInsert(Trigger.new, Trigger.oldMap);
        }
        if(Trigger.isUpdate){
            AccountTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap, Trigger.newMap);
            //AccountTrialTriggerHandler.afterUpdate(Trigger.newMap);
        }
        if(Trigger.isDelete){

        }
        if(Trigger.isUndelete){
            
        }
    }
}