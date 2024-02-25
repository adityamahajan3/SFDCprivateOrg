public with sharing class Welcome2Sfdc {
    public void printWelcome() {
        System.debug('Welcome to Salesforce');
        delete [SELECT Id, AccountId FROM Contact WHERE AccountId != null LIMIT 100];
        //List<Contact> oppListDelete = [SELECT Id, Name FROM Contact WHERE Name LIKE 'Test Contact  %'];
        //delete oppListDelete;
        //List<Product2> prodListDelete = [SELECT Id, Name FROM Product2 WHERE Name LIKE 'Product %'];
        //delete prodListDelete;
        /*
        List<Product2> prodListLatest = [SELECT Id, Name FROM Product2 WHERE Name LIKE 'Product %' ORDER BY CreatedDate DESC LIMIT 1];
        System.debug(prodListLatest[0]);
        Integer StartNo = Integer.valueOf(prodListLatest[0].Name.substring(8));
        System.debug(StartNo);

        List<Opportunity> oppListLatest = [SELECT Id, Name FROM Opportunity WHERE Name LIKE 'Test Opportunity %' ORDER BY CreatedDate DESC LIMIT 1];
        Integer newStartNo=0;
        if(oppListLatest[0]!=null){
            System.debug(oppListLatest[0]);
            newStartNo = Integer.valueOf(oppListLatest[0].Name.substring(17));
            System.debug(newStartNo);
        }
        else {
            System.debug('newStartNo= '+newStartNo);
        }*/
    }
}
/*
Welcome2Sfdc w = new Welcome2Sfdc();
w.printWelcome();
*/