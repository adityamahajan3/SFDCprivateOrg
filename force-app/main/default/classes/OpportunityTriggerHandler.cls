public with sharing class OpportunityTriggerHandler {
    public static void beforeDelete(List<Opportunity> oldOppList) {
        OpportunityTriggerHelper.adminDeletesClosedOpp(oldOppList);
    }
}