public with sharing class ContactTriggerHelper {
    /*6) Write a trigger, to have the count of total number of contacts associated to an account. */
    public static void noOfContactsRelated2Acc(List<Contact> newConList) {
        List<Account> accToUpdate = new List<Account>();
        List<Contact> ContactsCount = [SELECT AccountId FROM Contact WHERE AccountId IN (SELECT Id FROM Account)];
        for(Contact c : newConList){
            Account a = new Account();
            a.No_of_Contacts__c = ContactsCount.Size();
            accToUpdate.add(a);
        }
        update accToUpdate;
    }
}