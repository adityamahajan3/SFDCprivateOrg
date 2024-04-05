public with sharing class OpportunityTriggerHandler {
    public static void beforeDelete(List<Opportunity> oldOppList) {
        //OpportunityTriggerHelper.adminDeletesClosedOpp(oldOppList);
    }
    public static void afterUpdate(List<Opportunity> newOppList, Map<Id,Opportunity> oldOppMap){
        OpportunityTriggerHelper.sendEmailToClosedWonOpp(newOppList, oldOppMap);
    }
}