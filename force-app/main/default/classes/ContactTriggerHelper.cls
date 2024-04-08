public with sharing class ContactTriggerHelper {
    /*6) Write a trigger, to have the count of total number of contacts associated to an account. */
    public static void noOfContactsRelated2Acc(Map<Id,Contact> newConMap) {
        List<Account> accToUpdate = new List<Account>();
        List<AggregateResult> arList = [SELECT COUNT(Id) cnt FROM Contact WHERE AccountId IN: newConMap.keySet() GROUP BY AccountId];
        for(AggregateResult ar : arList){
            Account a = new Account();
            a.Id = (Id)ar.get('AccountId');
            a.No_of_Contacts__c = (Integer)ar.get('cnt');
            accToUpdate.add(a);
        }
        update accToUpdate;
    }
}