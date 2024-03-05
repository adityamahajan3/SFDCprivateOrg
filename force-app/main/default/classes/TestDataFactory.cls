@isTest
public with sharing class TestDataFactory {
    @TestVisible
    static List<Account> createAccount() {
        List<Account> createdAcc = new List<Account>();
        for(Integer i = 0;i<200;i++){
            Account acc = new Account(name='Test Account'+i);
            createdAcc.add(acc);
        }
        insert createdAcc;
        return createdAcc;
    }
    @TestVisible
    static List<Contact> createContact() {
        List<Contact> returnConList = new List<Contact>();
        for(Integer i;i<100;i++){
            Contact con = new Contact(FirstName='Test',LastName='Contact'+i);
            returnConList.add(con);
        }
        insert returnConList;
        return returnConList;
    }
}