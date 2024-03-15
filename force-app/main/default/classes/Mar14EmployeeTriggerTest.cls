@isTest
public with sharing class Mar14EmployeeTriggerTest {
    @isTest 
    static void ifIisOne() {
        List<Employee__c> eListSales = Mar14TestDataFactory.empToInsert(25,'Sales');
        List<Employee__c> eListService = Mar14TestDataFactory.empToInsert(25,'Service');
        Test.startTest();
        try{
            Database.insert(eListSales,false);
            Database.insert(eListService,false);
        }
        catch(Exception e){

            System.assert(e.getMessage()==null);
        }
        
        Test.stopTest();
        List<Onboarding_Checklist__c> testOCsales = [SELECT Id, Name FROM Onboarding_Checklist__c WHERE Employee__c=: eListSales[0].Id];
        System.assertEquals(3, testOCsales.size());
        System.assertEquals(eListSales[0].Department__c + ' Goal', testOCsales[0].Name);

        List<Onboarding_Checklist__c> testOCservice = [SELECT Id, Name FROM Onboarding_Checklist__c WHERE Employee__c=: eListService[0].Id];
        System.assertEquals(3, testOCservice.size());
        System.assertEquals(eListService[0].Department__c + ' Goal', testOCservice[0].Name);
    }
    @isTest
    static void ifIisTwo() {
        List<Employee__c> eListSales = Mar14TestDataFactory.empToInsert(25,'Sales');
        List<Employee__c> eListService = Mar14TestDataFactory.empToInsert(25,'Service');
        Test.startTest();
        try{
            Database.insert(eListSales,false);
            Database.insert(eListService,false);
        }
        catch(Exception e){

            System.assert(e.getMessage()==null);
        }
        Test.stopTest();
        List<Onboarding_Checklist__c> testOCsales = [SELECT Id, Name FROM Onboarding_Checklist__c WHERE Employee__c=: eListSales[0].Id];
        System.assertEquals(3, testOCsales.size());
        System.assertEquals(eListSales[0].Department__c + ' Job Training', testOCsales[1].Name);

        List<Onboarding_Checklist__c> testOCservice = [SELECT Id, Name FROM Onboarding_Checklist__c WHERE Employee__c=: eListService[0].Id];
        System.assertEquals(3, testOCservice.size());
        System.assertEquals(eListService[0].Department__c + ' Job Training', testOCservice[1].Name);
    }
    @isTest
    static void ifIisThree(){
        List<Employee__c> eListSales = Mar14TestDataFactory.empToInsert(25,'Sales');
        List<Employee__c> eListService = Mar14TestDataFactory.empToInsert(25,'Service');
        Test.startTest();
        try{
            Database.insert(eListSales,false);
            Database.insert(eListService,false);
        }
        catch(Exception e){

            System.assert(e.getMessage()==null);
        }
        Test.stopTest();
        List<Onboarding_Checklist__c> testOCsales = [SELECT Id, Name FROM Onboarding_Checklist__c WHERE Employee__c=: eListSales[0].Id];
        System.assertEquals(3, testOCsales.size());
        System.assertEquals(eListSales[0].Department__c + ' Role', testOCsales[2].Name);

        List<Onboarding_Checklist__c> testOCservice = [SELECT Id, Name FROM Onboarding_Checklist__c WHERE Employee__c=: eListService[0].Id];
        System.assertEquals(3, testOCservice.size());
        System.assertEquals(eListService[0].Department__c + ' Role', testOCservice[2].Name);
    }
    @isTest
    static void isFailure(){
        List<Employee__c> eListSales = Mar14TestDataFactory.empToInsert(25,'Marketing');
        List<Employee__c> eListService = Mar14TestDataFactory.empToInsert(25,'Social Media');//Because Department__c is picklist with 2 values(Sales or Service)
        Test.startTest();
        try{
            Database.insert(eListSales,false);
            Database.insert(eListService,false);
        }
        catch(Exception e){

            System.assert(e.getMessage()!=null);
        }
        Test.stopTest();
        List<Onboarding_Checklist__c> testOCsales = [SELECT Id, Name FROM Onboarding_Checklist__c WHERE Employee__c=: eListSales[0].Id];
        System.assert(testOCsales.size()==0);

        List<Onboarding_Checklist__c> testOCservice = [SELECT Id, Name FROM Onboarding_Checklist__c WHERE Employee__c=: eListService[0].Id];
        System.assert(testOCservice.size()==0);
    }
}