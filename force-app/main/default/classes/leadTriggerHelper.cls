public with sharing class leadTriggerHelper {
    public static void leadFieldUpdate(List<Lead> leadList) {
        for(Lead l : leadList){
            if(l.LeadSource=='Web'){
                l.Rating='cold';
            }
            else {
                l.Rating='hot';
            }
        }
    }
}