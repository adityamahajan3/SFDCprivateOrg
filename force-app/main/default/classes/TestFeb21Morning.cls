@isTest
public class TestFeb21Morning {
    @TestSetup
    public static void setupTestData() {
        /*List<Account> testAccListInsert = new List<Account>();
        List<Contact> testConListInsert = new List<Contact>();
        for (Integer i = 0; i < 200; i++) {
            Account testAccount = new Account(Name = 'Test Account'+i);
            testAccListInsert.add(testAccount);
            Contact testContact = new Contact(
                FirstName = 'Test',
                LastName = 'Contact',
                AccountId = testAccount.Id
            );
            testConListInsert.add(testContact);
            
        }
        insert testAccListInsert;
        insert testConListInsert;
        */
        List<Account> createdAccounts = TestDataFactory.createAccount();
        List<Contact> createdContacts = TestDataFactory.createContact();
        if (!createdAccounts.isEmpty() && !createdContacts.isEmpty()) {
            for (Integer i = 0; i < createdContacts.size() && i < createdAccounts.size(); i++) {
                createdContacts[i].AccountId = createdAccounts[i].Id;
            }
        }
    }

    @isTest
    static void testErrorBeforeDeleting() {
        
        Test.startTest();
        List<Account> testAccListDelete = [SELECT Id,(SELECT Id FROM Contacts WHERE AccountId != null ) FROM Account LIMIT 100];
        Database.DeleteResult[] deleteResults = Database.delete(testAccListDelete, false);
        Test.stopTest();
        System.assertEquals(false, deleteResults[0].isSuccess(), 'Delete operation should NOT be successful');
    }
    @isTest
    static void testNoErrorBeforeDeleting() {
        Test.startTest();
        List<Account> testAccListDelete = [SELECT Id FROM Account WHERE Id NOT IN (SELECT AccountId FROM Contact WHERE AccountId != null ) LIMIT 100];
        Database.DeleteResult[] deleteResults = Database.delete(testAccListDelete, false);
        Test.stopTest();
        System.assertEquals(true, deleteResults[0].isSuccess(), 'Delete operation should be successful');
    }
}