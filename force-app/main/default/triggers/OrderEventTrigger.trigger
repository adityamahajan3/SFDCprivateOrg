trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<Task> tasksToInsert = new List<Task>();
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) { 
            Task t1 = new Task();
            t1.Priority = 'Medium';
            t1.Subject = 'Follow up on shipped order 105';
            t1.OwnerId = event.CreatedById;
            tasksToInsert.add(t1);
        }
    }
    insert tasksToInsert;
}