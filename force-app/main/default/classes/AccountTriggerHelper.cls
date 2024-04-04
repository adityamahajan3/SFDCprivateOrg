public without sharing class AccountTriggerHelper {
    public static void createOneContact(List<Account> newAcc) {
        List<Contact> conList = new List<Contact>();
        for(Account a:newAcc){
            Contact c = new Contact();
            c.AccountId=a.Id;
            conList.add(c);
        }
        insert conList;
    }
}