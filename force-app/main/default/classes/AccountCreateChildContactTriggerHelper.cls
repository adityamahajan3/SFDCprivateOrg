public with sharing class AccountCreateChildContactTriggerHelper {
    public static void createChildContact(List<Account> accList) {
        List<Contact> conList = new List<Contact>(); 
        for (Account a : accList) {
            Contact c = new Contact();
            c.LastName = 'Trigger Generated ' + Integer.valueOf(Math.random() * 100);
            c.AccountId = a.Id;
            conList.add(c);
        }
        insert conList;
    }
}
