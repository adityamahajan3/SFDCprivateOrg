trigger OrderValidationTrigger on Custom_Order__c (before insert, before update) {
    feb26Afternoon.validateOrders(trigger.new);//Future method called inside Synchronous method
}