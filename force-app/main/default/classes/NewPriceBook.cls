public with sharing class NewPriceBook {
    public static void algoPriceBook() {
        List<PricebookEntry> pbeList = new List<PricebookEntry>();
        List<Product2> prodList = new List<Product2>();

        for (Integer i = 1; i <= 10; i++) {
            Product2 p = new Product2();
            p.Name = 'Feb12_Product ' + i;
            prodList.add(p);
        }

        insert prodList;

        // Create Algo Pricebook
        Pricebook2 algoPricebook = new Pricebook2();
        algoPricebook.Name = 'Algo Pricebook';
        insert algoPricebook;

        // Query the Standard Pricebook Id
        Pricebook2 stdPbId = [SELECT Id FROM Pricebook2 WHERE IsStandard = TRUE LIMIT 1];

        // Create PricebookEntries for each Product
        for(Integer i = 1; i <= 10; i++){
            PricebookEntry pbe = new PricebookEntry();
            pbe.Product2Id = prodList[i-1].Id;
            pbe.Pricebook2Id = stdPbId.Id;
            pbe.UseStandardPrice = false;
            pbe.UnitPrice = 100000;
            pbeList.add(pbe);
        }
        insert pbeList;
    }
}
/*
NewPriceBook.algoPriceBook();
 */