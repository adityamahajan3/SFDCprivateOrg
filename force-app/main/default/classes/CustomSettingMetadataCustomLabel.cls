public class CustomSettingMetadataCustomLabel {
    public static void addRecordToCustomSetting() {
    // Step 1: Get the Custom Setting record (assuming you have a unique identifier)
    CollegeCollection__c mySetting = CollegeCollection__c.getInstance(UserInfo.getUserId()); 

    // If you don't have a unique identifier, fetch based on some other criteria
    // Example:
    // CollegeCollection__c mySetting = [SELECT Id FROM CollegeCollection__c LIMIT 1]; 

    // Step 2: Set the Email field
    mySetting.EmailId__c = 'adi3mahajan@gmail.com';

    // Step 3: Save (Insert) the changes
    insert mySetting; 

    }
    public static void addRecordToCustomMetadata(){

    }
    public static void assignErrorToCustomLabel(){
        
    }
}