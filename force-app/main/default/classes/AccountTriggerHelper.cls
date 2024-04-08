public without sharing class AccountTriggerHelper {
    /* 1) Write a trigger, when a new Account is created then create a contact related to that account. */
    public static void createOneContactForEveryAccount(List<Account> newAccList) {
        List<Contact> conList = new List<Contact>();
        for(Account a:newAccList){
            Contact c = new Contact();
            c.FirstName=a.Name;
            c.LastName='Added via trigger';
            c.AccountId=a.Id;
            conList.add(c);
        }
        insert conList;
    }
    /* 2) Write a trigger, if the owner of an account is changed then the owner for the related contacts should also be updated. */
    public static void makeContactOwnerSameAsAccount(List<Account> newAccList){
        List<Contact> conList = new List<Contact>();
        for(Account a : newAccList){
            Contact c = new Contact();
            if(c.AccountId!=null){
                c.Owner = a.Owner;
                conList.add(c);
            }
        }
        update conList;
    }
    /* 3) Write a trigger, to create new Opportunity whenever an account is created/updated for Industry – Agriculture. */
    public static void newOppWhenIndustryAgriAccountCreatedOrUpdated(List<Account> newAccList, Map<Id, Account> oldnewAccMap) {
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account a : newAccList){
            if (a.Industry == 'Agriculture' && (oldnewAccMap == null || a.Industry != oldnewAccMap.get(a.Id).Industry) ) {                Opportunity opp = new Opportunity();
                opp.Name = 'Opp Belongs to ' + a.Name + ' ' + System.now();
                opp.StageName = 'Prospecting';
                opp.CloseDate = Date.today().addMonths(2);
                opp.Amount = 10000;
                opp.Description = ' Created because industry is Agriculture';
                opp.AccountId = a.Id;
                oppList.add(opp);
            }
        }
        insert oppList;
    }
    /* 4) Write a trigger, user should not be able to delete any account with associated contact. */
    public static void errorDeletingAccountHavingContacts(List<Account> oldAccList, Map<Id,Account> oldnewAccMap) {
        List<Contact> relatedContacts = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :oldnewAccMap.keySet()];
        Set<Id> relatedaccID = new Set<Id>();
        for (Contact con : relatedContacts) {
            relatedaccID.add(con.AccountId);
        }   
        for(Account acc :oldAccList)
        {
            if (relatedaccID.contains(acc.Id)) {
                acc.addError('Account cannot be deleted because AccountTriggerHelper.cls record has related to one or more contacts'); // throw error to prevent deletion
            }                             
        } 
    }
    /* 7) Write a trigger, whenever the BillingCity of any Account is updated, update MailingCity of all the Contacts related to the account. */
    public static void updateConMailingCityFromAccBillingCity(Map<Id,Account> oldAccMap, Map<Id,Account> newAccMap){
        
        List<Contact> relConList =[SELECT Id, MailingCity, AccountId FROM Contact WHERE AccountId IN: newAccMap.keySet()];
        Set<Id> accId = new Set<Id>();
        List<Contact> conToUpdate = new List<Contact>();
        for(Contact c : relConList){
            if(oldAccMap.get(c.AccountId).BillingCity != newAccMap.get(c.AccountId).BillingCity){
                c.AccountId = newAccMap.get(c.AccountId).Id;
                c.MailingCity = newAccMap.get(c.AccountId).BillingCity;
                conToUpdate.add(c);
            }
        }
        update conToUpdate;
    }
}