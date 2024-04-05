public with sharing class OpportunityTriggerHelper {
/*Write a trigger, only admin can delete closed opportunities and email should be sent to owners for closed won opportunities. */
    /*public static void adminDeletesClosedOpp(List<Opportunity> oldOppList) {
        if(Trigger.isDelete){
            Set<Id> adminId = new Set<Id>();
            Map<Id,Opportunity> adminUser = new Map<Id,Opportunity>([SELECT Id FROM User WHERE ProfileId IN (SELECT Id FROM Profile WHERE Name = 'System Administrator')]);
            
            adminId.addAll(adminUser.keySet());
            for(Opportunity o : oldOppList){
                if(o.StageName == 'Closed Won' || o.StageName == 'Closed Lost'){
                    if(!adminId.contains(UserInfo.getUserId())){
                        o.addError('Only System Administrator can delete a closed opportunity');
                    }
                }
            }
        }
    }*/
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