/**
 * @description       : 
 * @author            : aditya.mahajan@aethereus.com
 * @group             : 
 * @last modified on  : 04-10-2024
 * @last modified by  : aditya.mahajan@aethereus.com
**/
public class SharingRecords {

    public static void shareRecords() {
        User emp = new User();
        emp =[SELECT Id FROM User WHERE LastName = 'emp1' LIMIT 1];
        Id userId = emp.Id;
        List<Book__c> bookIds = new List<Book__c>();
        bookIds = [SELECT Id FROM Book__c];
        List<Book__Share> sharesToCreate = new List<Book__Share>();
        for (Book__c bookId : bookIds) {
            Book__Share newShare = new Book__Share(ParentId = bookId.Id, UserOrGroupId = userId, AccessLevel = 'Read');
            sharesToCreate.add(newShare);
        }
        insert sharesToCreate; 
    }

    public static void deleteShares() {
        User emp = new User();
        emp =[SELECT Id FROM User WHERE LastName = 'emp1' LIMIT 1];
        Id userId = emp.Id;
        List<Book__c> bookIds = new List<Book__c>();
        bookIds = [SELECT Id FROM Book__c];
        List<Book__Share> sharesToDelete = [SELECT Id FROM Book__Share WHERE ParentId IN :bookIds AND UserOrGroupId = :userId ];
        delete sharesToDelete;
    }
}
/*
SharingRecords.shareRecords();
SharingRecords.deleteShares();
*/