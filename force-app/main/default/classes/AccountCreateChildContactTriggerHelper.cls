public with sharing class AccountCreateChildContactTriggerHelper {
    public static void createChildContact(List<Account> accList) {
        for(Account a : accList){
            Contact c = new Contact(LastName = 'Trigger Generated '+Integer.valueOf(Math.random()*100), AccountId = a.Id);
            insert c;
        }
    }
}