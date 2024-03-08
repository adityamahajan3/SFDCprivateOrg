public with sharing class Mar7SobjectStringMapping {
    public static Map<String, List<sObject>> stringSobjectMap(List<sObject> sObjectList, String fieldApiName) {
        Map<String, List<sObject>> groupedMap = new Map<String, List<sObject>>();
        if (sObjectList.isEmpty()) {
            return groupedMap;
        }
        sObject genericSObject = sObjectList[0];
        Schema.DescribeSObjectResult sObjectDescribe = genericSObject.getSObjectType().getDescribe();
    
        if (!sObjectDescribe.fields.getMap().containsKey(fieldApiName)) {
            throw new IllegalArgumentException('Invalid field API name: ' + fieldApiName);
        }
        for (sObject obj : sObjectList) {
            String fieldValue = String.valueOf(obj.get(fieldApiName));
            if (!groupedMap.containsKey(fieldValue)) {
                groupedMap.put(fieldValue, new List<sObject>()); 
            } 
            groupedMap.get(fieldValue).add(obj);
        }
        return groupedMap;
    }    
}