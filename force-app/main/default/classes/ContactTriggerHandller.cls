public with sharing class ContactTriggerHandller {
    public static void afterInsert(Map<Id,Contact> newConMap) {
        ContactTriggerHelper.noOfContactsRelated2Acc(newConMap);
    }
    public static void afterUpdate(Map<Id,Contact> newConMap){
        ContactTriggerHelper.noOfContactsRelated2Acc(newConMap);
    }
    public static void afterDelete(Map<Id,Contact> newConMap){
        ContactTriggerHelper.noOfContactsRelated2Acc(newConMap);
    }
    public static void afterUndelete(Map<Id,Contact> newConMap){
        ContactTriggerHelper.noOfContactsRelated2Acc(newConMap);
    }
}