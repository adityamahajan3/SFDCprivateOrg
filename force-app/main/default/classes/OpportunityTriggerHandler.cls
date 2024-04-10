/**
 * @description       : 
 * @author            : aditya.mahajan@aethereus.com
 * @group             : 
 * @last modified on  : 04-10-2024
 * @last modified by  : aditya.mahajan@aethereus.com
**/
public with sharing class OpportunityTriggerHandler {
    public static void beforeUpdate(Map<Id,Opportunity> newOppMap, Map<Id,Opportunity> oldOppMap){
        OpportunityTriggerHelper.opportunityValidationTrigger(newOppMap, oldOppMap);
    }
    public static void beforeDelete(List<Opportunity> oldOppList) {
        OpportunityTriggerHelper.adminDeletesClosedOpp(oldOppList);
    }
    public static void afterinsert(Map<Id,Opportunity> newOppMap, Map<Id,Opportunity> oldOppMap){
        OpportunityTriggerHelper.updateTotalOpportunityAmountOnAccount(newOppMap, oldOppMap);
    }
    public static void afterUpdate(List<Opportunity> newOppList, Map<Id,Opportunity> oldOppMap, Map<Id,Opportunity> newOppMap){
        OpportunityTriggerHelper.sendEmailToClosedWonOpp(newOppList, oldOppMap);
        OpportunityTriggerHelper.updateTotalOpportunityAmountOnAccount(newOppMap, oldOppMap);
    }
}