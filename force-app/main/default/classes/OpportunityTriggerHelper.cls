/**
 * @description       : 
 * @author            : aditya.mahajan@aethereus.com
 * @group             : 
 * @last modified on  : 04-10-2024
 * @last modified by  : aditya.mahajan@aethereus.com
**/
public with sharing class OpportunityTriggerHelper {
    /*5)Write a trigger, only admin can delete closed opportunities */
    public static void adminDeletesClosedOpp(List<Opportunity> oldOppList) {
        if(Trigger.isDelete){
            Set<Id> adminId = new Set<Id>();
            Map<Id,User> adminUser = new Map<Id,User>([SELECT Id FROM User WHERE ProfileId IN (SELECT Id FROM Profile WHERE Name = 'System Administrator')]);
            adminId.addAll(adminUser.keySet());
            for(Opportunity o : oldOppList){
                if(o.StageName == 'Closed Won' || o.StageName == 'Closed Lost'){
                    if(!adminId.contains(UserInfo.getUserId())){
                        o.addError('Only System Administrator can delete a closed opportunity');
                    }
                }
            }
        }
    }
    /*5)Email should be sent to owners for closed won opportunities. */
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
    /*Write an Apex trigger named “OpportunityTrigger” that automatically updates a custom field named “TotalOpportunityAmount” on the Account object whenever an Opportunity related to that Account is closed/won.*/
    public static void updateTotalOpportunityAmountOnAccount(Map<Id,Opportunity> newOppMap, Map<Id,Opportunity> oldOppMap){
        Set<Id> accIds = new Set<Id>();
        for(Opportunity o : newOppMap.values()){
            if(o.AccountId!=null && o.StageName=='Closed Won' && oldOppMap.get(o.Id).StageName != 'Closed Won'){
                accIds.add(o.AccountId);
            }
        }
        List<AggregateResult> aggregates = [SELECT AccountId, SUM(Amount) tot FROM Opportunity WHERE AccountId IN :accIds AND StageName = 'Closed Won' GROUP BY AccountId];
        Map<Id,Decimal> accId2TotMap = new Map<Id,Decimal>();
        for(AggregateResult ar : aggregates){
            accId2TotMap.put((Id)ar.get('AccountId'), (Decimal)ar.get('tot'));
        }
        List<Account> acc2Update = [SELECT Id, TotalOpportunityAmount__c FROM Account WHERE Id IN: accIds];
        for(Account a : acc2Update){
            a.TotalOpportunityAmount__c = accId2TotMap.get(a.Id);
        }
        update acc2Update;
    }
    /* 11) Write an Apex trigger named “OpportunityValidationTrigger” that fires before update and enforces some conditions. If any of the conditions are violated, the trigger should add the appropriate custom error messages to the Opportunity record.
            in this case an opportunity Stage cannot be updated to "Closed Won" if its old amount or new amount is less than 10,000*/
    public static void opportunityValidationTrigger(Map<Id,Opportunity> newOppMap, Map<Id,Opportunity> oldOppMap){
        for(Opportunity o : oldOppMap.values()){
            if((o.Amount<10000 || newOppMap.get(o.Id).Amount<10000) && (newOppMap.get(o.Id).StageName=='Closed Won'))
            {
                o.addError('Opportunity Amount cannot be less than 10,000 if it is to be updated to Closed Won');
            }
        }
    }
}