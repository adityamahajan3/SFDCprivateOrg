trigger Mar14EmployeeTrigger on Employee__c (after insert) {
    List<Onboarding_Checklist__c> OCList = new List<Onboarding_Checklist__c>();
    for(Employee__c e :Trigger.new){
        for(Integer i =1;i<=3;i++){
            Onboarding_Checklist__c oc = new Onboarding_Checklist__c();
            if(i==1){
                oc.name = e.Department__c+' Goal';
            }
            else if(i==2){
                oc.name = e.Department__c+' Job Training';
            }
            else if(i==3){
                oc.name = e.Department__c+' Role';
            }
            oc.Completed__c = false;
            oc.Employee__c = e.id;
            OCList.add(oc);
        }
    }
    try {
        Database.insert(OCList, false);    
    } catch (Exception e) {
        System.debug('An unexpected error occurred: ' + e.getMessage());
    }
}