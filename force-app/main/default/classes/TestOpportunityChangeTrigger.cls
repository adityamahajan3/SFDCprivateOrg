@isTest
public with sharing class TestOpportunityChangeTrigger {
    @isTest
    public static void testCreateAndUpdateOpportunity() {
        Test.enableChangeDataCapture();
        // Insert an Employee test record
        Opportunity opp = new Opportunity();
        opp.Name ='Sell 100 Widgets';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today().addMonths(3);
        insert opp;
        // Call deliver to fire the trigger and deliver the test change event.
        Test.getEventBus().deliver();
        // VERIFICATIONS
        // Check that the change event trigger created a task.
        List<Opportunity> oppRecords = [SELECT Id,StageName FROM Opportunity];
        Opportunity opp1 = oppRecords[0];
        opp1.StageName = 'Closed Won';
        update opp1;
        // Call deliver to fire the trigger and deliver the test change event.
        Test.getEventBus().deliver();
        List<Task> taskList = [SELECT Id,Subject FROM Task];
        System.assertEquals(1, taskList.size(), 'The change event trigger did not create the expected task.');
    }
}