@isTest
private class LeadProcessorTest {

    @isTest static void testBatchUpdate() {
        // Create test Lead records
        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            testLeads.add(new Lead(LastName = 'Test Lead ' + i, Company = 'Test Company'));
        }
        insert testLeads;

        // Verify initial state (Leads should not have 'Dreamforce' LeadSource)
        List<Lead> leadsBeforeUpdate = [SELECT Id, LeadSource FROM Lead];
        for (Lead lead : leadsBeforeUpdate) {
            System.assertNotEquals('Dreamforce', lead.LeadSource);
        }

        // Execute the batch class
        Test.startTest(); 
        LeadProcessor batch = new LeadProcessor();
        Database.executeBatch(batch);
        Test.stopTest();

        // Verify updates
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead];
        for (Lead lead : updatedLeads) {
            System.assertEquals('Dreamforce', lead.LeadSource);
        }
    }
}