public with sharing class OpportunityTriggerHandler {
    public static void beforeDelete(List<Opportunity> oldOppList) {
        OpportunityTriggerHelper.adminDeletesClosedOpp(oldOppList);
    }
    public static void afterUpdate(List<Opportunity> newOppList, List<Opportunity> oldOppMap){
        OpportunityTriggerHelper.sendEmailToClosedWonOpp(newOppList, oldOppMap);
    }
}