List<Account> acc = [SELECT Id,Name,Industry FROM Account LIMIT 10];

System.debug(Mar7SobjectStringMapping.stringSobjectMap(acc, 'Industry'));