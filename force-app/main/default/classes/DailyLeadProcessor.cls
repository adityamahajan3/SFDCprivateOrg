public without sharing class DailyLeadProcessor implements Schedulable{
    public void execute(SchedulableContext sc) {
        List<Lead> leadList = [SELECT Id, LeadSource FROM Lead WHERE LeadSource=null LIMIT 200];
        for(Lead l:leadList){
            l.LeadSource='Dreamforce';
        }
        update leadList;
    }
}