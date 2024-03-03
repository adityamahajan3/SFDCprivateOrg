@isTest(seeAllData = false)
public class TestFeb21Morning {
    @TestSetup
    public static void setupTestData() {
        List<Account> testAccListInsert = new List<Account>();
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
    }

    @isTest
    static void testErrorBeforeDeleting() {
        
        Test.startTest();
        List<Account> testAccListDelete = [SELECT Id FROM Account WHERE Name LIKE 'Test Account%' LIMIT 200];
        Database.DeleteResult[] deleteResults = Database.delete(testAccListDelete, false);
        Test.stopTest();
        System.assertEquals(false, deleteResults[1].isSuccess(), 'Delete operation should not be successful');
    }
}
