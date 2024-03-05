@isTest
public with sharing class mar3TestDataFactory {
    public static List<Account> insertedAccounts(Integer noOfAcc) {
        List<Account> testAccListInsert = new List<Account>();
        List<Contact> testConListInsert = new List<Contact>();
        for (Integer i = 0; i < noOfAcc; i++) {
            Account testAccount = new Account(Name = 'Test Account'+i);
            testAccListInsert.add(testAccount);

            Contact testContact = new Contact(
                FirstName = 'Test',
                LastName = 'Contact',
                AccountId = testAccount.Id
            );
            testConListInsert.add(testContact);
        }
        insert testConListInsert;
        return testAccListInsert;
    }
}