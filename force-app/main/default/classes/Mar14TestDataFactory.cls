public with sharing class Mar14TestDataFactory {
    @TestVisible
    static List<Employee__c> empToInsert(Integer emps, String dep) {
        List<Employee__c> eList = new List<Employee__c>();
        for(Integer i=1;i<=emps;i++){
            Employee__c e = new Employee__c();
            e.name = 'Test Employee'+i;
            e.Employee_Email__c = 'test'+i+'@gmail.com';
            e.Start_date__c = Date.today().addDays(-7);
            e.Department__c = dep;
            eList.add(e);
        }
        return eList;
    }
}