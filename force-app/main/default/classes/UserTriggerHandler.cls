public with sharing class UserTriggerHandler {
    public static void afterInsert(Map<Id,User> newUserMap) {
        UserTriggerHelper.addSysAdminToAdminsPublicGroup(newUserMap);
    }
    public static void afterUpdate(Map<Id,User> newUserMap, Map<Id,User> oldUserMap){
        UserTriggerHelper.userProfileChange(newUserMap, oldUserMap);
    }
}