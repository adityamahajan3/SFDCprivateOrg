public with sharing class AccountTrialTriggerHandler {
    public static void updateRelatedConPhone(Map<Id,Account> newMap) {
        List<Contact> relatedConList = [SELECT Id, Phone, AccountId FROM Contact WHERE AccountId IN: newMap.keySet()];
        for(Contact con : relatedConList){
            con.Phone = newMap.get(con.AccountId).Phone;
        }
    update relatedConList;
    }
}