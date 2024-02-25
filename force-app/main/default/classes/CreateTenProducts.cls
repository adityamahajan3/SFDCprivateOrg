public with sharing class CreateTenProducts {
    public static void createProducts() {
        List<Product2> prodList = new List<Product2>();
        //List<Product2> prodListLatest = [SELECT Id, Name FROM Product2 WHERE Name LIKE 'Product %' ORDER BY CreatedDate DESC LIMIT 1];
        Integer lastInsertedNo=0;
        /*
        if(prodListLatest[0]!=null){
            System.debug(prodListLatest[0]);
            lastInsertedNo = Integer.valueOf(prodListLatest[0].Name.substring(8));//parses the string into a substring from the 8th index and then converts it to an integer
            System.debug(lastInsertedNo);
        }
        */
        Integer start_i = lastInsertedNo+1;
        Integer compare_i = lastInsertedNo+10;
        for (Integer i = start_i; i <= compare_i; i++) {
            Product2 p = new Product2();
            p.Name = 'Product ' + i;
            p.Description = 'Product Description withainit '+i;
            //p.ProductCode = 'P-' + i;
            //p.IsActive = true;
            //p.Product_Inventory__c = Math.round( (Math.random()*100)+1 );//random integer between 1-100
            if ( Math.mod(i,2)==0 ) {
                p.Family = 'Hardware';
            } 
            else {
                p.Family = 'Software';
            }
            prodList.add(p);
        }
        insert prodList;
        /*for(Integer j=0;j<10;j++)
            System.debug(prodList[j]);
        */
    }
}
/*
CreateTenProducts.createProducts();
 */