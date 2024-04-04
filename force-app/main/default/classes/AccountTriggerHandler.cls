public without sharing class AccountTriggerHandler {
    public static void afterInsert(List<Account> newAcc) {
        AccountTriggerHelper.createOneContact(newAcc);
    }
}