public class Mar27CustomIterable implements Iterable<Account> {
    public Iterator<Account> iterator(){
       List<Account> values =
       [SELECT Id, Name 
        FROM Account
        LIMIT 10];
       return new Mar27CustomIterator(values);
    }
 }