public with sharing class feb22Morning {
    public static void total(List<Contact> ConList){
        /* Trigger to create a roll-up summary of Contact’s fields on Accounts
On each Account, the Total Salary custom field should hold the sum of Salaries from its
associated Contacts. The trigger should work whenever a Contact’s Salary is updated,
New Contact is Created or when an existing Contact is deleted. */
        // Collect Account IDs related to the Contacts being modified
        Set<Id> accountIds = new Set<Id>();
        if(ConList != null){
        	for (Contact c : ConList) {
            	accountIds.add(c.AccountId);
        	}
        }
        // Database.query for related Accounts that are triggered, including their Contacts 
        List<AggregateResult> result = Database.query('SELECT SUM(Salary__c) Total, AccountId FROM Contact WHERE AccountId IN :accountIds GROUP BY AccountId');
        List<Account> accountsToUpdate = new List<Account>();
        for(AggregateResult res : result) {
            Account accToUpdate = new Account();
            Id accId = (Id)res.get('AccountId');
            Decimal tot = (Decimal)res.get('Total');
            accToUpdate.Id = accId;
            accToUpdate.Total_Salary__c = tot;
            accountsToUpdate.add(accToUpdate); 
        }
        update accountsToUpdate;
    }
}