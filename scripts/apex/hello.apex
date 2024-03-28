List<Account> acc = [SELECT Name,Industry FROM Account where Industry !=null LIMIT 20];

System.debug(Mar7SobjectStringMapping.stringSobjectMap(acc, 'Industry'));

CustomSettingMetadataCustomLabel.addRecord();
CollegeCollection__c mySetting = new CollegeCollection__c();
System.debug(mySetting.EmailId__c);

Mar19CreatingEventsClass.multipleEvents();


String json = '{'+
		'    \"id\": \"0015h00001fFpVJAA0\",'+
		'    \"success\": true,'+
		'    \"errors\": []'+
		'}';

System.debug(JSON2Apex.parse(json));
