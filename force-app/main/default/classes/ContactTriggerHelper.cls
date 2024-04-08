public with sharing class ContactTriggerHelper {
    /*6) Write a trigger, to have the count of total number of contacts associated to an account. */
    public static void noOfContactsRelated2Acc(Map<Id,Contact> ConMap) {
        Set<Id> accIds = new Set<Id>();
        for(Contact c : ConMap.values()){
            if(c.AccountId!=null){
                accIds.add(c.AccountId);
            }
        }
        List<Account> accToUpdate = new List<Account>();
        List<AggregateResult> arList = Database.query('SELECT COUNT(Id) cnt, AccountId FROM Contact WHERE AccountId IN: accIds GROUP BY AccountId');
        for(AggregateResult ar : arList){
            Account a = new Account();
            a.Id = (Id)ar.get('AccountId');
            System.debug((Integer)ar.get('cnt'));
            a.No_of_Contacts__c = (Integer)ar.get('cnt');
            accToUpdate.add(a);
        }
        update accToUpdate;
    }
}