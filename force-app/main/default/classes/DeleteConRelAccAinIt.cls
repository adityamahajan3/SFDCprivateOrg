public with sharing class DeleteConRelAccAinIt {
    public DeleteConRelAccAinIt() {
    }
    public static void conRelAccAinIt(){
        List<Contact> conList = [SELECT Id,name,AccountId,Account.Name FROM Contact WHERE Account.Name LIKE '%A%'];
        Database.delete (conList,false);
        Database.DeleteResult[] deleteResults = Database.delete(conList, false);
        for (Database.DeleteResult result : deleteResults) {
            if (!result.isSuccess()) {
                for (Database.Error error : result.getErrors()) {
                    if (!result.isSuccess()) {
                        System.debug('Error deleting contact with error: ' + error.getStatusCode() + ' - ' + error.getMessage());
                    }
                }
            }
        }
    }
}


/*
DeleteConRelAccAinIt.conRelAccAinIt();
*/