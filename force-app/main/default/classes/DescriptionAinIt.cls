public with sharing class DescriptionAinIt {
    public DescriptionAinIt(String searchString ) {
        searchString = '%' + String.escapeSingleQuotes(searchString) + '%';//removes single quotes and only returns the value inside the searchString variable
        List<Product2> productList = [SELECT Name,Description FROM Product2 WHERE Description LIKE:searchString LIMIT 50];
        for(Product2 prod : productList) {//declaring an object prod of type Product2 and iterating it over List prodList
            System.debug('Product Name: ' + prod.Name +'Product Description: '+prod.Description);
        }
    }
}
/*
DescriptionAinIt d = new DescriptionAinIt('a');
 */