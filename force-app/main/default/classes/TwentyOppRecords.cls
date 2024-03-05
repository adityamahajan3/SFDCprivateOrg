public with sharing class TwentyOppRecords {
    public void createOpportunities() {
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i = 0; i <20 ; i++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opportunity ' + Datetime.now();
            opp.CloseDate = Date.today().addDays(Math.mod(i,30));  // close date ranges from  today + 1 to 30 days from today
            opp.StageName = 'Closed Lost'; // choose a specific StageName
            opp.reason__c = 'Just cause';
            oppList.add(opp);
        }
        insert oppList;
    }
}
/*
TwentyOppRecords t = new TwentyOppRecords();
t.createOpportunities();
 */