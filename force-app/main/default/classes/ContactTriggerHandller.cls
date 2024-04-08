public with sharing class ContactTriggerHandller {
    public static void afterInsert(List<Contact> newConList) {
        ContactTriggerHelper.noOfContactsRelated2Acc(newConList);
    }
    public static void afterUpdate(List<Contact> newConList){
        ContactTriggerHelper.noOfContactsRelated2Acc(newConList);
    }
    public static void afterDelete(List<Contact> newConList){
        ContactTriggerHelper.noOfContactsRelated2Acc(newConList);
    }
    public static void afterUndelete(List<Contact> newConList){
        ContactTriggerHelper.noOfContactsRelated2Acc(newConList);
    }
}