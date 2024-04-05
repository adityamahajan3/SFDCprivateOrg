public with sharing class OpportunityTriggerHelper {
    /*Write a trigger, only admin can delete closed opportunities and email should be sent to owners for closed won opportunities. */
    public static void adminDeletesClosedOpp(List<Opportunity> oldOppList) {
        List<Profile> admin = [SELECT Id, Name, UserType FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
        
    }
}