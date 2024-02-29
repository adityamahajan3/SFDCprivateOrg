@isTest
private class LeadProcessorTest {

    @isTest static void testBatchUpdate() {
        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            testLeads.add(new Lead(LastName = 'Test Lead ' + i, Company = 'Test Company'));
        }
        insert testLeads;

        List<Lead> leadsBeforeUpdate = [SELECT Id, LeadSource FROM Lead];
        for (Lead lead : leadsBeforeUpdate) {
            System.assertNotEquals('Dreamforce', lead.LeadSource);
        }

        Test.startTest(); 
        LeadProcessor batch = new LeadProcessor();
        Database.executeBatch(batch);
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead];
        for (Lead lead : updatedLeads) {
            System.assertEquals('Dreamforce', lead.LeadSource);
        }
    }
}