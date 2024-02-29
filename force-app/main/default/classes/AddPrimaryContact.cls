public class AddPrimaryContact implements Queueable{
    private Contact contact;
    private String state;
    public AddPrimaryContact(Contact con, String state){
        this.contact=con;
        this.state=state;
    }
    public void execute(QueueableContext qc){
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState =:state LIMIT 200];
        List<Contact> contacts = new List<Contact>();
        for(Account acc : accounts){
            Contact contactClone = contact.clone();
            contactClone.AccountId = acc.Id;
            contacts.add(contactClone);
        }
        insert contacts;
    }
}