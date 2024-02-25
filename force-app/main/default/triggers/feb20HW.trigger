trigger feb20HW on Contact (before insert) {
    Map<String, Contact> aadharMap = new Map<String, Contact>();
    Map<String, Contact> panMap = new Map<String, Contact>();
    Set<String> aadharNumbers = new Set<String>();
    Set<String> panNumbers = new Set<String>();
    for (Contact con : Trigger.new) {
        if(con.Aadhar__c!='')
            aadharNumbers.add(con.Aadhar__c);
        if(con.Pan__c!='')
            panNumbers.add(con.Pan__c);
    }
    for (Contact existingContact : [SELECT Id, Aadhar__c, Pan__c FROM Contact WHERE Aadhar__c IN :aadharNumbers OR Pan__c IN :panNumbers]) {
            aadharMap.put(existingContact.Aadhar__c, existingContact);
            panMap.put(existingContact.Pan__c, existingContact);
    }
    for (Contact con : Trigger.new) {
        if (aadharMap.containsKey(con.Aadhar__c) && panMap.containsKey(con.Pan__c)) {
            con.Duplicate_Check__c = 'Both';
        } else if (aadharMap.containsKey(con.Aadhar__c)) {
            con.Duplicate_Check__c = 'Aadhar Duplicate';
        } else if (panMap.containsKey(con.Pan__c)) {
            con.Duplicate_Check__c = 'Pan Duplicate';
        } else if (!aadharMap.containsKey(con.Aadhar__c) && !panMap.containsKey(con.Pan__c)) {
            con.Duplicate_Check__c = 'None';
        }
    }
}