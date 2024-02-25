public with sharing class Sctrpt9Feb {
    public void runClasses() {
        System.debug('Q1 From Class TwentyOppRecords');
        TwentyOppRecords t = new TwentyOppRecords();
        t.createOpportunities();//method is non static - void return type

        System.debug('Q2 From Class CreateTenProducts');
        CreateTenProducts.createProducts();//method is static - void return type - input startno and endno to create no of products - difference betn startno and endno should be 9

        System.debug('Q3 From Class AccAscPrint');
        AccAscPrint a = new AccAscPrint();
        a.printAcc();//method is non static - void return type

        System.debug('Q4 From Class UpperCaseContacts');
        UpperCaseContacts u = new UpperCaseContacts();//method is non static - void return type - input LIMIT in soql query
        u.UpperCaseSingleChar();

        System.debug('Q5 From Class DescriptionAinIt');
        DescriptionAinIt d = new DescriptionAinIt('a');//directly implimented from the class constructor - input string to search if product description contains the string in it

    }
}
/*
Sctrpt9Feb s = new Sctrpt9Feb();
s.runClasses();
 */