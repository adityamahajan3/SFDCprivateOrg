public with sharing class Script12Feb {
    public static void runClasses() {
        System.debug('Q1 Create 10 contacts with 10 different Account(Lookup) values in them');
        TenConTenAccLU.createContacts();

        System.debug('Q2 Print 1, (1+1)^2 = 4, (4+1)^2=25...');
        SquareOfAnswers.squareOfValues();

        System.debug('Q3 Print any integer in reverse');
        ReverseInteger.reverse();


        System.debug('Q4 update all opportunities with future Closed Date to the name with "F" appended to their name ');
        FutureOpps.future();

        System.debug('Q5 create a new price book Algo Pricebook with 10 products whose prices are not null in them');
        NewPriceBook.algoPriceBook();
       
        System.debug('Q6 Delete all contacts related to account whose name field contains "a" in it');
        DeleteConRelAccAinIt.conRelAccAinIt();

        System.debug('Q7 delete all opportunities with ClosedDate < today');
        DeletePastOpp.deleteAll();
    }
}
/*
Script12Feb.runClasses();
 */