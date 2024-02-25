public class AccAscPrint{
    public void printAcc(){
        List<Account> accList = [SELECT Name FROM Account ORDER BY Name ASC LIMIT 50];
        for(Account acc : accList){
            System.debug(acc.Name);
        }
    }
}
/*
AccAscPrint a = new AccAscPrint();
a.printAcc();
 */