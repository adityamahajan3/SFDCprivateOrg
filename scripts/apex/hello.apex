Id uid = UserInfo.getUserId();
Integer i =[SELECT COUNT() FROM Opportunity WHERE OwnerId =: uid];
system.debug(uid);