@isTest
public class AccountProcessorTest {
    @isTest
    static void testCountContacts() {
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<5;i++){
        Account acc1 = new Account();
        acc1.name='Test acc1';
        accList.add(acc1);
        }
        insert accList;
        List<Id> accountIds = new List<Id>();
        for(Account a : accList){
            accountIds.add(a.id);
        }
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        List<AggregateResult> results = Database.query('SELECT AccountId, COUNT(Id) contactCount FROM Contact WHERE AccountId IN :accountIds GROUP BY AccountId');
        System.assertEquals(5,results.size());
        system.assertEquals(1,results[0].get('contactCount'));
       
    }
}