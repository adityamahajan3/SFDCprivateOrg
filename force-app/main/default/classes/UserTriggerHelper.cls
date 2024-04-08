public with sharing class UserTriggerHelper {
    /* 8) Write a trigger, whenever a new active User having profile “System Administrator” is inserted, add the user to the public group “Admins” */
    public static void addSysAdminToAdminsPublicGroup(Map<Id,User> newUserMap) {
        Group adminGroup =[SELECT Id, Type, Name  FROM Group WHERE Name = 'Admins' AND Type = 'Regular' LIMIT 1];
        Profile adminProfile = [SELECT Name, Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
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
    public static void userProfileChange(Map<Id,User> newUserMap, Map<Id,User> oldUserMap) {
        String profileName;
        Boolean active;
        Group adminGroup =[SELECT Id, Type, Name  FROM Group WHERE Name = 'Admins' AND Type = 'Regular' LIMIT 1];
        Profile adminProfile = [SELECT Name, Id FROM Profile WHERE Name = 'Standard Platform User'  LIMIT 1];
        List<GroupMember> gmAddList = new List<GroupMember>();
        List<GroupMember> gmDelList = new List<GroupMember>();
        if(oldUserMap != newUserMap){
            for(User u : newUserMap.values()){
                if(u.ProfileId == adminProfile.Id && u.isActive == true){
                    GroupMember gm = new GroupMember();
                    gm.UserOrGroupId = u.Id;
                    gm.GroupId = adminGroup.Id;
                    gmAddList.add(gm);
                }
                else{
                    GroupMember gm = new GroupMember();
                    gm.UserOrGroupId = u.Id;
                    gm.GroupId = adminGroup.Id;
                    gmDelList.add(gm);
                }
            }
            insert gmAddList;
            delete gmDelList;
        }
    }
}