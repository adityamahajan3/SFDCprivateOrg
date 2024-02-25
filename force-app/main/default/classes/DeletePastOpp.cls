public with sharing class DeletePastOpp {
    public static void deleteAll(){
        Date today = Date.today();
        List<Opportunity> oppList = [SELECT Id, Name, CloseDate FROM Opportunity ORDER BY CloseDate ASC];
        List<Opportunity> oppListRemove = new List<Opportunity>();
        for(Opportunity opp : oppList)
        {
            if(opp.CloseDate < today){
                oppListRemove.add(opp);
            }
        }
        Database.delete(oppListRemove,False);
        Database.DeleteResult[] deleteResults = Database.delete(oppListRemove, false);
        for (Database.DeleteResult result : deleteResults) {
            if (!result.isSuccess()) {
                for (Database.Error error : result.getErrors()) {
                    System.debug('Error deleting contact with error: ' + error.getStatusCode() + ' - ' + error.getMessage());
                }
            }
        }
    }
}
/*
DeletePastOpp.deleteAll();
*/