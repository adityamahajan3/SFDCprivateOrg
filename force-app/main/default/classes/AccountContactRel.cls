public with sharing class AccountContactRel {
    public void AccountContactRel1() {
        Account a = new Account(Name='Akatsuki Technologies');
        insert a;
        Contact c1 = new Contact(LastName='Bakal', AccountId=a.Id);
        Contact c2 = new Contact(LastName='Rahane', AccountId=a.Id);
        insert c1;
        insert c2;
    }
}