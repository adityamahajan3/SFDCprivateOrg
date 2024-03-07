public with sharing class Mar7SobjectStringMapping {
    public static Map<String, List<SObject>> stringSobjectMap(List<SObject> inputRecords, String fieldApiName) {
        Map<String, List<SObject>> recordMapping = new Map<String, List<SObject>>();
        for (SObject record : inputRecords) {
            Object fieldValue = record.get(fieldApiName);
            if (fieldValue != null) {
                String fieldValueAsString = String.valueOf(fieldValue);
                if (!recordMapping.containsKey(fieldValueAsString)) {
                    recordMapping.put(fieldValueAsString, new List<SObject>());
                }
                recordMapping.get(fieldValueAsString).add(record);
            }
        }
        return recordMapping;
    }
}