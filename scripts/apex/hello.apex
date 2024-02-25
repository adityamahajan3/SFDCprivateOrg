List<Subscription__c> sl = new List<Subscription__c>();
Date sd1 = Date.newInstance(2022, 12, 1);
System.debug(sd1);
Subscription__c s1 = new Subscription__c(Name='GoDaddy',Status__c='',Account__c='0015h00001c0nNKAAY',Start_Date__c=sd1,Subscription_Term__c=365);
insert (s1);//Aethereus
Date sd2 = Date.newInstance(2021, 1, 12);
Subscription__c s2 = new Subscription__c(Name='Spotify',Status__c='',Account__c='0015h00001cLtwjAAC',Start_Date__c=sd2,Subscription_Term__c=500);
sl.add(s2);//Aditya Mahajan
Date sd3 = Date.newInstance(2024, 24, 1);
Subscription__c s3 = new Subscription__c(Name='AWS',Status__c='Active',Account__c='0015h00001cLtwjAAC',Start_Date__c=sd3,Subscription_Term__c=7000);
sl.add(s3);//Aditya Mahajan
Date sd4 = Date.newInstance(2022, 30, 11);
Subscription__c s4 = new Subscription__c(Name='Prime video',Status__c='Active',Account__c='0015h00001c0nNKAAY',Start_Date__c=sd4,Subscription_Term__c=2000);
sl.add(s3);//Aethereus
Date sd5 = Date.newInstance(2022, 12, 1);
Subscription__c s5 = new Subscription__c(Name='Hotstar',Status__c='Active',Account__c='0015h00001c0nNKAAY',Start_Date__c=sd5,Subscription_Term__c=2753);
sl.add(s5);//Aethereus
insert sl;