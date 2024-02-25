public class DisplayAccountContacts {
    public void displayContacts() {
        // Query all accounts and their related contacts
        List<Account> accounts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account];
        
        // Loop through each account
        for(Account acc : accounts) {
            System.debug('Account Name: ' + acc.Name);
            
            // Check if the account has any contacts
            if(!acc.Contacts.isEmpty()) {
                System.debug('Contacts:');
                
                // Loop through each contact of the account
                for(Contact con : acc.Contacts) {
                    System.debug('Contact Name: ' + con.Name);
                }
            } else {
                System.debug('No Contacts');
            }
        }
    }
}

/*
DisplayAccountContacts.displayContacts();
*/