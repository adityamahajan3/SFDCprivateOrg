public without sharing class AccountTriggerHandler {
    public static void afterInsert(List<Account> newAcc) {
        AccountTriggerHelper.createOneContactForEveryAccount(newAcc);
    }
    public static void afterUpdate(List<Account> newAcc){
        AccountTriggerHelper.makeContactOwnerSameAsAccount(newAcc);
    }
}