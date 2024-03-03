trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            System.debug('Before Insert: Trigger.new Values: ' + Trigger.new);
        }
        if (Trigger.isUpdate) {
            System.debug('Before Update: Trigger.new Values: ' + Trigger.new);
            System.debug('Before Update: Trigger.old Values: ' + Trigger.old);
        }
        if (Trigger.isDelete) {
            System.debug('Before Delete: Trigger.old Values: ' + Trigger.old);
        }
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            System.debug('After Insert: Trigger.new Values: ' + Trigger.new);
            //feb21morning.updateAcc(Trigger.new,Trigger.old,'AFTER_INSERT');
            feb22Morning.total(Trigger.new);
        }
        if (Trigger.isUpdate) {
            System.debug('After Update: Trigger.new Values: ' + Trigger.new);
            System.debug('  '+Trigger.operationType+'After Update: Trigger.old Values: ' + Trigger.old);
            if(Trigger.operationType == System.TriggerOperation.AFTER_UPDATE){
                //feb21morning.updateAcc(Trigger.new,Trigger.old,'AFTER_UPDATE');
                feb22Morning.total(Trigger.new);
            } 
        }
        if (Trigger.isDelete) { 
            System.debug('  '+Trigger.operationType+'After Delete: Trigger.old Values: ' + Trigger.old.size());
            if(Trigger.operationType == System.TriggerOperation.AFTER_DELETE){
                //feb21morning.updateAcc(Trigger.new,Trigger.old,'AFTER_DELETE');
                feb22Morning.total(Trigger.old);
            }
        }
        if (Trigger.isUndelete) {
            System.debug('After Undelete: Trigger.new Values: ' + Trigger.new+'Operation Type: '+Trigger.operationType); 
        }
    }
}