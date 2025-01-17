public with sharing class feb21morning {
    /*10.) Write a trigger in which if an account that has related contacts and the user tries to delete that account it throws you an error "Account cannot be deleted because it has related to one or more contacts". */
    public static void errorBeforeDeleting(List<Account> oldAccList, Map<Id,Account> oldAccMap) {
        
        List<Contact> relatedContacts = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :oldAccMap.keySet()];
        Set<Id> relatedaccID = new Set<Id>();
        for (Contact con : relatedContacts) {
            relatedaccID.add(con.AccountId);
        }   
        for(Account acc :oldAccList)
        {
            if (relatedaccID.contains(acc.Id)) {
                acc.addError('Account cannot be deleted because AccountTriggerHelper.cls record has related to one or more contacts'); // throw error to prevent deletion
                break; // because even if 1 contact present, stop checking further
            }                             
        }
    }
    public static void updateAcc(List<Contact> newConList, List<Contact> oldConList, String triggerOperationType){
        /* Write a logic to update the count of number of contacts on Account. whenever a  contact is created or updated or deleted.*/

        // Collect Account IDs related to the Contacts being modified
        Set<Id> accountIds = new Set<Id>();
        if(newConList!=	null){
        	for (Contact c : newConList) {
            	accountIds.add(c.AccountId);
        	}
        }

        if (triggerOperationType=='AFTER_DELETE') {
            for (Contact c : oldConList) {
                accountIds.add(c.AccountId);
            }
        }
        // Query for related Accounts, including their Contacts
        List<Account> accountsToUpdate = [SELECT Id, No_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountIds];
        // Update the number of Contacts for each Account
        for (Account acc : accountsToUpdate) {
            acc.No_of_Contacts__c = acc.Contacts.size();
        }
        // Update the Accounts in bulk
        update accountsToUpdate;
    }
}