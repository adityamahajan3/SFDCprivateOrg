@isTest
public with sharing class Mar4TestDataFactoryOpportunity {
    @TestVisible
    static List<Opportunity> createOppRecords(String stageNameInput, Integer noOfRecords) {
        List<Opportunity> oppList = new List<Opportunity>();
        for (Integer i=0; i<noOfRecords; i++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opp Closed Lost ' + i;
            opp.CloseDate = Date.today().addDays(30+i);
            opp.Reason__c = 'Just Cause';//to satisfy validation rule
            opp.StageName = stageNameInput;
            OppList.add(opp);
        }
        insert oppList;
        return oppList;
    }
}