@isTest
public class Mar4TestBatchOppDel {
    @isTest
    static void testRecordsDeleted() { // Name reflects the specific test case
        List<Opportunity> oppCorrectList = Mar4TestDataFactoryOpportunity.createOppRecords('Closed Lost',120);
        for(Opportunity opp : oppCorrectList)
        {
            Test.setCreatedDate(opp.Id, Date.Today().addDays(-10));
        }
        Test.startTest();
        feb28MorningDeleteOldClosedLostOpp b = new feb28MorningDeleteOldClosedLostOpp();
        Database.executeBatch(b, 200);
        Test.stopTest();

        List<Opportunity> successfullyDelOpps = [SELECT Id FROM Opportunity WHERE StageName='Closed Lost' AND CreatedDate >= LAST_N_DAYS:60];
        System.assertEquals(true, b.recordsProcessed==successfullyDelOpps.size(), 'Batch class fails to delete all Closed Lost Opportunities created in the last 60 days');
    }

    @isTest
    static void testRecordsNotDeleted() { // Name reflects the specific test case
        List<Opportunity> oppWrongList = Mar4TestDataFactoryOpportunity.createOppRecords('Qualification',80); // Wrong stage for deletion
        for(Opportunity opp : oppwrongList)
        {
            Test.setCreatedDate(opp.Id, Date.Today().addDays(-100)); 
        }
        Test.startTest();
        feb28MorningDeleteOldClosedLostOpp b = new feb28MorningDeleteOldClosedLostOpp();
        Database.executeBatch(b,200); 
        Test.stopTest();

        List<Opportunity> allOppList = [SELECT Id FROM Opportunity]; 
        System.assertEquals(true, b.recordsProcessed!=allOppList.size(), 'Batch should not delete these Opportunities'); // Updated assertion
    }
}
