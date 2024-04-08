public with sharing class UserTriggerHelper {
    public static void addSysAdminToAdminsPublicGroup(Map<Id,User> newUserMap) {
        Group adminGroup =[SELECT Id, Type, Name  FROM Group WHERE Name = 'Admins' AND Type = 'Regular' LIMIT 1];
        Profile adminProfile = [SELECT Name, Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
        List<GroupMember> gmList = new List<GroupMember>();
        for(User u : newUserMap.values()){
            if(u.ProfileId == adminProfile.Id && u.isActive == true){
                GroupMember gm = new GroupMember();
                gm.UserOrGroupId = u.Id;
                gm.GroupId = adminGroup.Id;
                gmList.add(gm);
            }
        }
        insert gmList;
    }
}