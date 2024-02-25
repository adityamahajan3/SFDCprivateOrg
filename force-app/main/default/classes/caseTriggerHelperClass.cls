public with sharing class caseTriggerHelperClass {
    public static void caseFieldUpdate(List<Case> caseList) {
        for(Case c : CaseList){
            if(c.origin == 'Email'){
                c.Priority = 'Medium';
                c.Status = 'New';
            }
        }
    }
}