public without sharing class AccountTriggerHandler {
    public static void afterInsert(List<Account> newAccList) {
        AccountTriggerHelper.createOneContactForEveryAccount(newAccList);
        AccountTriggerHelper.newOppWhenIndustryAgriAccountCreatedOrUpdated(newAccList);
    }
    public static void afterUpdate(List<Account> newAccList){
        AccountTriggerHelper.makeContactOwnerSameAsAccount(newAccList);
        AccountTriggerHelper.newOppWhenIndustryAgriAccountCreatedOrUpdated(newAccList);   
    }
    public static void beforeDelete(Map<Id,Account> oldAccMap){
        AccountTriggerHelper.errorBeforeDeleting(oldAccMap);
    }
}