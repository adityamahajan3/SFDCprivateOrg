public without sharing class AccountTriggerHandler {
    public static void afterInsert(List<Account> newAccList, Map<Id, Account> oldAccMap) {
        AccountTriggerHelper.createOneContactForEveryAccount(newAccList);
        AccountTriggerHelper.newOppWhenIndustryAgriAccountCreatedOrUpdated(newAccList, oldAccMap);
    }
    public static void afterUpdate(List<Account> newAccList, Map<Id, Account> oldAccMap){
        AccountTriggerHelper.makeContactOwnerSameAsAccount(newAccList);
        AccountTriggerHelper.newOppWhenIndustryAgriAccountCreatedOrUpdated(newAccList, oldAccMap);   
    }
    public static void beforeDelete(List<Account> oldAccList, Map<Id,Account> oldAccMap){
        AccountTriggerHelper.errorDeletingAccountHavingContacts(oldAccList, oldAccMap);
    }
}