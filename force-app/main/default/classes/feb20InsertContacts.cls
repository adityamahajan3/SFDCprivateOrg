public with sharing class feb20InsertContacts {
    public static void contactInsert() {
        List<Contact> cList = new List<Contact>();
        String formattedDateTime=Datetime.now().format('dd MM yyyy HH mm ss');
        Contact c1 = new contact(LastName='feb20 bulk '+formattedDateTime,Aadhar__c='7389',Pan__c='p15');
        Contact c2 = new contact(LastName='feb20 bulk '+formattedDateTime,Aadhar__c='098764',Pan__c='P16');
        Contact c3 = new contact(LastName='feb20 bulk '+formattedDateTime,Aadhar__c='09',Pan__c='P9');
        Contact c4 = new contact(LastName='feb20 bulk '+formattedDateTime,Aadhar__c='098654',Pan__c='P17');
        Contact c5 = new contact(LastName='feb20 bulk '+formattedDateTime,Aadhar__c='123490',Pan__c='P12');
        cList.add(c1);
        cList.add(c2);
        cList.add(c3);
        cList.add(c4);
        cList.add(c5);
        insert cList;
    }
}
/*
feb20InsertContacts.contactInsert();
*/