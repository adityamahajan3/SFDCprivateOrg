public class TenConTenAccLU {
    public static void createContacts(){
        List<Contact> conList = new List<Contact>();
        List<Account> accList = [SELECT id, name FROM Account WHERE name LIKE 'AAA%' ORDER BY name ASC LIMIT 10 ];
        for(Integer i = 1; i <= 10 ; i++){
            Contact con = new Contact();
            con.LastName = 'Test Contact ' + i;
            con.AccountId = accList[i-1].Id;
            conList.add(con);
        }
        insert conList;
    }   
}
/*
TenConTenAccLU.createContacts();
 */