public with sharing class Mar14InvocableMethod {
    @InvocableMethod(label='return non selected item list' description='Returns the list of Onbording Checklist that has not been selected')
    public static List<Onboarding_Checklist__c> notSelectedItems(List<Onboarding_Checklist__c> activeOCList) {
        List<Onboarding_Checklist__c> nonSelectedRecords = new List<Onboarding_Checklist__c>();
        List<Onboarding_Checklist__c> selectedRecords = [SELECT Id,Completed__c FROM Onboarding_Checklist__c WHERE Id IN :activeOCList.Id];
        for(Onboarding_Checklist__c oc : selectedRecords) {
                nonSelectedRecords.add(oc);
        }
        return nonSelectedRecords;
    }
}