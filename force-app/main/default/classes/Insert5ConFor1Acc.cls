public with sharing class Insert5ConFor1Acc {
    public Insert5ConFor1Acc() {
        List<Contact> conlist = new List<Contact>();
        Account a = new Account();
        a.Name='1AccountInsertedFor5Contacts';
        insert a;
        for(Integer i=1; i<=5; i++)
        {
            Contact c = new Contact();
            c.LastName='5ContactsInserted' + i;
            c.AccountId=a.Id;
            conlist.add(c);
        }
        insert conlist;
    }
}