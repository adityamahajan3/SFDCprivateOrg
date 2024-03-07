@isTest
public with sharing class DailyLeadProcessorTest {
    @isTest
    public static void checkExecute() {
        String cron = '0 0 0 ? * * *';
        List<Lead> leads = new List<Lead>();
        for(Integer i=0;i<500;i++){
            if(i<250){
                Lead l = new Lead(LastName='Lead'+i,Company='Lead '+i);
            	leads.add(l);
            }
            else{
                lead l = new Lead(LastName = 'Lead '+i,Company='Lead '+i, LeadSource = 'other');
                leads.add(l);
            }
        }
        insert leads;
        Test.startTest();
        String jobId = System.schedule('Lead Processor',cron,new DailyLeadProcessor());
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE LeadSource='Dreamforce'];
        System.AssertEquals(200,updatedLeads.size(),'ERROR: At least 1 record not updated correctly');

        List<CronTrigger> ct =[SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id =:jobId];
        System.debug('Next fire time '+ct[0].NextFireTime);
    }
}