List<Account> acc = [SELECT Name,Industry FROM Account where Industry !=null LIMIT 20];

System.debug(Mar7SobjectStringMapping.stringSobjectMap(acc, 'Industry'));

CustomSettingMetadataCustomLabel.addRecord();
CollegeCollection__c mySetting = [SELECT Id, EmailId__c FROM CollegeCollection__c LIMIT 1];
System.debug(mySetting);