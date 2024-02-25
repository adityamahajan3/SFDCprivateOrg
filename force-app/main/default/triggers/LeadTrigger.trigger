trigger LeadTrigger on Lead (before insert) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            System.debug('After Insert: Trigger.new Values: ' + Trigger.new);
            leadTriggerHelper.leadFieldUpdate(Trigger.new);
        }
    }
}