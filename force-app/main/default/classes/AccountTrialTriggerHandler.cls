public with sharing class AccountTrialTriggerHandler {
    public static void afterUpdate(Map<Id,Account> newMap) {
        AccountTrialTriggerHelper.updateRelatedConPhone(newMap);
    }
}