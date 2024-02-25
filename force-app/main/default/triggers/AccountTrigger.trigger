trigger AccountTrigger on Account (after insert,before delete) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            System.debug('After Insert: Trigger.new Values: ' + Trigger.new);
            AccountCreateChildContactTriggerHelper.createChildContact(Trigger.new);
        }
    }
    if(Trigger.isBefore && Trigger.isDelete){
        feb21morning.errorBeforeDeleting(Trigger.oldMap);
    }
}