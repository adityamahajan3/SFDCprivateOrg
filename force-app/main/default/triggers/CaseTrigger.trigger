trigger CaseTrigger on Case (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            System.debug('After Insert: Trigger.new Values: ' + Trigger.new);
            caseTriggerHelperClass.caseFieldUpdate(Trigger.new);
        }
    }
}