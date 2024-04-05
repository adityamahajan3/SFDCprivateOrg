trigger AccountTrigger on Account (after insert, before delete) {
    if(Trigger.isBefore){
        if(Trigger.isDelete){
            //feb21morning.errorBeforeDeleting(Trigger.oldMap);
            AccountTriggerHandler.beforeDelete(Trigger.old,Trigger.oldMap);
        }
    }
    if (Trigger.isAfter) {
        if(Trigger.isUpdate){
            AccountTriggerHandler.afterUpdate(Trigger.new);
        }
        if (Trigger.isInsert) {
            //AccountCreateChildContactTriggerHelper.createChildContact(Trigger.new);
            AccountTriggerHandler.afterInsert(Trigger.new);
        }
    }
}