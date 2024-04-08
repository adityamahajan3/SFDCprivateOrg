public with sharing class OpportunityTriggerHelper {
/*5)Write a trigger, only admin can delete closed opportunities */
    public static void adminDeletesClosedOpp(List<Opportunity> oldOppList) {
        if(Trigger.isDelete){
            Set<Id> adminId = new Set<Id>();
            Map<Id,User> adminUser = new Map<Id,User>([SELECT Id FROM User WHERE ProfileId IN (SELECT Id FROM Profile WHERE Name = 'System Administrator')]);
            adminId.addAll(adminUser.keySet());
            for(Opportunity o : oldOppList){
                if(o.StageName == 'Closed Won' || o.StageName == 'Closed Lost'){
                    System.debug(UserInfo.getUserId());
                    if(!adminId.contains(UserInfo.getUserId())){
                        o.addError('Only System Administrator can delete a closed opportunity');
                    }
                }
            }
        }
    }
    /*5)email should be sent to owners for closed won opportunities. */
    public static void sendEmailToClosedWonOpp(List<Opportunity> newOppList, Map<Id, Opportunity> oldOppMap){
        Set<Id> ownerIds = new Set<Id>();
        for(Opportunity o : newOppList){
            ownerIds.add(o.OwnerId);
        }
        Map<Id, User> EmailRecipientMap = new Map<Id, User>([SELECT Id, Name, Email FROM User WHERE Id IN: ownerIds]);
        for(Opportunity o : newOppList){
            if(o.StageName != oldOppMap.get(o.Id).StageName){
                System.debug('Old StageName: '+oldOppMap.get(o.Id).StageName);
                User EmailRecipient = EmailRecipientMap.get(o.OwnerId);
                if(o.StageName=='Closed Won'){
                    System.debug('New StageName: '+o.StageName);
                    System.debug('Owner Email: '+EmailRecipient.Email+'\nOwner Name: '+EmailRecipient.Name);
                    EmailManager.sendMail(EmailRecipient.Email, 'Opportunity update', 'Dear '+EmailRecipient.Name+'\nYour Opportunity ' + o.Name + ' has been updated to '+o.StageName+' ! \nCongratulations !');
                }
            }
        }
    }
}