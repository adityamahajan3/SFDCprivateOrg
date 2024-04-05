trigger Mar7OpportunityRecType on Opportunity (after update) {
    List<Opportunity> newServicingOpps = new List<Opportunity>();
    List<Opportunity> newDealOpp = new List<Opportunity>();
    for (Opportunity oldOpp : Trigger.old) {
        if (oldOpp.IsClosed && oldOpp.IsWon){
            //oldOpp.RecordTypeId = '0125h000002FDu1AAG';//"New Deal" RecordType Id from table RecordType
            newDealOpp.add(oldOpp);
            if(oldOpp.CloseDate == Date.today().addMonths(-6)) {
                Opportunity newOpp = oldOpp.clone();
                newOpp.Name = newOpp.Name + ' - Servicing';//"- Servicing" added to name to create
                //newOpp.RecordTypeId = '0125h000002FDu6AAG';//"Servicing" RecordType Id from table RecordType
                newOpp.CloseDate = Date.today().addDays(30);
                newServicingOpps.add(newOpp);
            }
        }
    }
    update newDealOpp;
    insert newServicingOpps;
}