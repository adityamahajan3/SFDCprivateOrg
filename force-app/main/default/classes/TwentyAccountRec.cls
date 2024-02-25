public with sharing class TwentyAccountRec {
    public void InsertAccounts() {
        List<Account> l1 = new List<Account>();
        for (Integer i = 21; i <= 40; i++) {
            Account a = new Account();
            a.Name = 'AAA Test ' + i;
            a.BillingCity = 'city'+i;
            a.Description = 'Account description'+i;
            a.BillingPostalCode = 'CODE'+i;
            a.BillingCountry = 'Country'+i;
            l1.add(a);
        }
        insert l1;
    }
}
/*
TwentyAccountRec a = new TwentyAccountRec();
a.InsertAccounts();
 */