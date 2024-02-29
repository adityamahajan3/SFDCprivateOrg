@isTest
private class AddPrimaryContactTest {
    @isTest
    private static void testQueueableClass(){
        List<Account> accounts = new List<Account>();
        for(Integer i =0;i<500;i++){
            Account acc = new account(name='Test Account'+i);
            if(i<250){
                acc.BillingState = 'NY';
            }
            else{
                acc.BillingState = 'CA';
            }
            accounts.add(acc);
        }
        insert accounts;
        Contact con = new Contact(FirstName='Jayant',LastName='Mahajan');
        insert con;
        Test.startTest();
        Id jobId = System.enqueueJob(new AddPrimaryContact(con , 'CA'));
        Test.stopTest();
        
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Contact.Account.BillingState = 'CA'];
        System.assertEquals(200, contacts.size(), 'ERROR: Incorrect number of Contact records found');
    }
}