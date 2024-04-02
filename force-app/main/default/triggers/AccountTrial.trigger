trigger AccountTrial on Account (after update) {
    List<Contact> relatedConList = [SELECT Id, Phone, AccountId FROM Contact WHERE AccountId IN: Trigger.newMap.keySet()];
    for(Contact con : relatedConList){
        con.Phone = Trigger.newMap.get(con.AccountId).Phone;
    }
    update relatedConList;
}