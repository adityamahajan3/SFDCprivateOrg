@isTest
public class TestFeb21Morning {

    @TestSetup
    public static void setupTestData() {
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        Contact testContact = new Contact(
            FirstName = 'Test',
            LastName = 'Contact',
            AccountId = testAccount.Id
        );
        insert testContact;
    }

    @isTest
    static void testErrorBeforeDeleting() {
        Account acc =[SELECT Id FROM Account WHERE Name = 'Test Account'];
        Test.startTest();
        Database.DeleteResult deleteResult = Database.delete(acc, false);
    
        System.assertEquals(false, deleteResult.isSuccess(), 'Delete operation should not be successful');
        System.assertEquals('Account cannot be deleted', deleteResult.getErrors()[0].getMessage(), 'Unexpected error message');
    }
}
