public with sharing class UserTriggerHandler {
    public static void afterInsert(Map<Id,User> newUserMap) {
        UserTriggerHelper.addSysAdminToAdminsPublicGroup(newUserMap);
    }
}