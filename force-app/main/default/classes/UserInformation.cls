public with sharing class UserInformation {
    public void displayUserInfo() {
        User x = [SELECT Id, Name, Phone, Email FROM User WHERE Id = :UserInfo.getUserId()];
        System.debug('Current user name: ' + x.Name);
        System.debug('Current user phone number: ' + x.Phone);
        System.debug('Current user email: ' + x.Email);
    }
}
/*
UserInformation ui = new UserInformation();
ui.displayUserInfo();
*/