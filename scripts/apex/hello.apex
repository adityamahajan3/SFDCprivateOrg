List<Account> acc = [SELECT Name,Industry FROM Account where Industry !=null LIMIT 20];

System.debug(Mar7SobjectStringMapping.stringSobjectMap(acc, 'Industry'));

CustomSettingMetadataCustomLabel.addRecord();
CollegeCollection__c mySetting = new CollegeCollection__c();
System.debug(mySetting.EmailId__c);