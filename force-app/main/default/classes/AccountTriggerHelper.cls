public without sharing class AccountTriggerHelper {
    public static void createOneContactForEveryAccount(List<Account> newAcc) {
        List<Contact> conList = new List<Contact>();
        for(Account a:newAcc){
            Contact c = new Contact();
            c.FirstName=a.Name;
            c.LastName=' Added via trigger';
            c.AccountId=a.Id;
            conList.add(c);
        }
        insert conList;
    }
}