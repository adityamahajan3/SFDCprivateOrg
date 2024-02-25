public with sharing class feb21evening {
    public static void beforeinsertupdate(List<Subscription__c> newList){
        Map<Id, Date> latestDateMap = new Map<Id, Date>();
        for (Subscription__c sub : newList) {
            if (sub.Status__c == 'Active') {
                sub.End_Date__c = sub.Start_Date__c.addDays(Integer.valueOf(sub.Subscription_Term__c));
            }
            if (sub.Status__c == 'Cancelled' && sub.Cancellation_Date__c != null) {
                if (!latestDateMap.containsKey(sub.Account__c) || sub.Cancellation_Date__c > latestDateMap.get(sub.Account__c)) {
                    latestDateMap.put(sub.Account__c, sub.Cancellation_Date__c);
                }
            } 
            else {
                if (!latestDateMap.containsKey(sub.Account__c) || sub.End_Date__c > latestDateMap.get(sub.Account__c)) {
                    latestDateMap.put(sub.Account__c, sub.End_Date__c);
                }
            }
        }

        List<Account> relatedAccounts = [SELECT Id, Last_Subscription_End_Date__c FROM Account WHERE Id IN :latestDateMap.keySet()];

        List<Account> accountsToUpdate = new List<Account>();
        for (Account account : relatedAccounts) {
            account.Last_Subscription_End_Date__c = latestDateMap.get(account.Id);
            accountsToUpdate.add(account);
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}