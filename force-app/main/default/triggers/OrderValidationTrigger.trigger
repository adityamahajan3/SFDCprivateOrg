trigger OrderValidationTrigger on Custom_Order__c (before insert, before update) {
    if(Trigger.isBefore)
        if(Trigger.isInsert || Trigger.isUpdate)
    feb26Afternoon.validateOrders(trigger.new);//Future method called inside Synchronous method
}