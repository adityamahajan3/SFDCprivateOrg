/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-10-2024
 * @last modified by  : aditya.mahajan@aethereus.com
**/
public with sharing class UserTriggerHelper {
    /* 8) Write a trigger, whenever a new active User having profile “System Administrator” is inserted, add the user to the public group “Admins” */
    public static void addSysAdminToAdminsPublicGroup(Map<Id,User> newUserMap) {
        Group adminGroup =[SELECT Id, Type, Name  FROM Group WHERE Name = 'Admins' AND Type = 'Regular' LIMIT 1];
        Profile adminProfile = [SELECT Name, Id FROM Profile WHERE Name = 'Standard Platform User' LIMIT 1];
        List<GroupMember> gmAddList = new List<GroupMember>();
        for(User u : newUserMap.values()){
            if(u.ProfileId == adminProfile.Id){
                GroupMember gm = new GroupMember();
                gm.UserOrGroupId = u.Id;
                gm.GroupId = adminGroup.Id;
                gmAddList.add(gm);
            }
        }
        insert gmAddList;
    }
    /* 9) Update Example 8, whenever user’s profile is changed from/to “System Administrator” AND user is marked active/inactive, add/delete the user to the public group “Admins”. */
    public static void userProfileChange(Map<Id,User> newUserMap) {
        Group adminGroup =[SELECT Id, Type, Name  FROM Group WHERE Name = 'Admins' AND Type = 'Regular' LIMIT 1];
        Profile adminProfile = [SELECT Name, Id FROM Profile WHERE Name = 'Standard Platform User' LIMIT 1];
        Set<Id> userToBeRemoved = new Set<Id>();
        for(User u : newUserMap.values()){
            if(u.ProfileId != adminProfile.Id && u.isActive == false){
                System.debug('User Id added to userToBeRemoved');
                userToBeRemoved.add(u.Id);
            }
        }
        List<GroupMember> gmDelList =[SELECT Id, UserOrGroupId, GroupId FROM GroupMember WHERE UserOrGroupId IN: userToBeRemoved];
        System.debug('gmDelList fetched and is to be deleted');
        List<Database.DeleteResult> deleteResults = Database.delete(gmDelList, false);
        for (Database.DeleteResult dr : deleteResults) {
            if (!dr.isSuccess()) {
                System.debug('Failure to delete');
            }
            else{
                System.debug('User Successfully removed from Public group Admins, check in settings');
            }
        }
        List<GroupMember> gmAddList = new List<GroupMember>();
        for(User u : newUserMap.values()){
            if(u.ProfileId == adminProfile.Id && u.isActive == true){
                GroupMember gm = new GroupMember();
                gm.UserOrGroupId = u.Id;
                gm.GroupId = adminGroup.Id;
                gmAddList.add(gm);
            }
        }
        insert gmAddList;
    }
}