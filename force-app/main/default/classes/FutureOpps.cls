public with sharing class FutureOpps {
    public static void future() {
        List<Opportunity> oppList = new List<Opportunity>();
        for (Opportunity opp : [SELECT Id, Name FROM Opportunity WHERE CloseDate > TODAY]) {
            opp.Name = opp.Name + 'F';
            oppList.add(opp);
        }
        update oppList;
    }
}
/*
FutureOpps.future();
*/