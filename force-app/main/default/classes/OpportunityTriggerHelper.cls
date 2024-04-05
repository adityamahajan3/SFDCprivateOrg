public with sharing class OpportunityTriggerHelper {
/*Write a trigger, only admin can delete closed opportunities and email should be sent to owners for closed won opportunities. */
    public static void adminDeletesClosedOpp(List<Opportunity> oldOppList) {
        List<User> adminUser = [SELECT Id, ProfileId FROM User WHERE ProfileId IN (SELECT Id FROM Profile WHERE Name = 'System Administrator')];
        for(Opportunity o : oldOppList){
            if(o.StageName == 'Closed Won' || o.StageName == 'Closed Lost'){
                if(UserInfo.getUserId() != adminUser[0].Id){
                    o.addError('Only System Administrator can delete a closed opportunity');
                }
            }
        }
    }
    public static void sendEmailToClosedWonOpp(List<Opportunity> newOppList, Map<Id, Opportunity> oldOppMap){
        for(Opportunity o : newOppList){
            if(o.StageName != oldOppMap.get(o.Id).StageName){
                if(o.StageName=='Closed Won'){
                    EmailManager.sendMail(o.Owner.Email, 'Opportunity update', 'Dear '+o.Owner.Name+'\n Your Opportunity ' + o.Name + ' has been updated to Closed Won ! \nCongratulations !');
                }
            }
        }
    }

    
}