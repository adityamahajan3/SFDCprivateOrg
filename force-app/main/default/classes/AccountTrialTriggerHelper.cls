public with sharing class AccountTrialTriggerHelper {
    public static void afterUpdate(Map<Id,Account> newMap) {
        AccountTrialTriggerHandler.updateRelatedConPhone(newMap);
    }
}