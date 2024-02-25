public with sharing class TwentyOppRecords {
    public TwentyOppRecords() {
    }
    public void createOpportunities() {
        List<Opportunity> oppList = new List<Opportunity>();
        //List<Opportunity> oppListLatest = [SELECT Id, Name FROM Opportunity WHERE Name LIKE 'Test Opportunity %' ORDER BY CreatedDate DESC LIMIT 1];
        Integer lastInsertedNo =0;
        /*if(oppListLatest[0]!=null){
            System.debug(oppListLatest[0]);
            lastInsertedNo = Integer.valueOf(oppListLatest[0].Name.substring(17));
            System.debug(lastInsertedNo);
        }
        */
        Integer start_i = lastInsertedNo+1;
        Integer compare_i = start_i+19;
        for(Integer i = start_i; i <= compare_i ; i++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opportunity ' + i;
            opp.CloseDate = Date.today().addDays(Math.mod(i,30));  // close date ranges from  today + 1 to 30 days from today
            opp.StageName = 'Prospecting'; // choose a specific StageName
            oppList.add(opp);
        }
        insert oppList;
    }
}
/*
TwentyOppRecords t = new TwentyOppRecords();
t.createOpportunities();
 */