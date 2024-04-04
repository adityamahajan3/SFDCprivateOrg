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


List<Integer> values = new List<Integer>{1,2,3,4,5};
Mar27IterableIteratorBatch M = new Mar27IterableIteratorBatch(values);
Database.executeBatch(M,5);

 Mar27BatchClass M = new Mar27BatchClass();
 Database.executeBatch(M,1);

Apr2RESTcallout.makeGetCallout();
Apr2RESTcallout.makePostCallout();

OlderAccountsUtility.updateOlderAccounts();