public class feb14PracticeDatabaseMerge {
    //  method to select master based on presence of AccountId 
    public static Integer masterIndex = 0;
    private static Contact determineMaster(List<Contact> contacts) {
        for (Contact c : contacts) {
            if (c.AccountId != null) {
                return c; // Contact linked to an Account
            }
            masterIndex++;
        }
        masterIndex=0;
        return contacts[0]; // No duplicate Contact record found, select the first as master
    }
    public static void mergeDuplicateContacts() {
        Map<String, List<Contact>> contactsByLastNameMap = new Map<String, List<Contact>>();

        // Find potential duplicate Contacts
        for (Contact con : [SELECT Id, LastName, AccountId FROM Contact]) {
            String lastNameKey = con.LastName.toLowerCase();

            if (!contactsByLastNameMap.containsKey(lastNameKey)) {
                contactsByLastNameMap.put(lastNameKey, new List<Contact>());
            }
            contactsByLastNameMap.get(lastNameKey).add(con);
        }
        // Process grouped duplicate contacts
        for (List<Contact> contactList : contactsByLastNameMap.values()) {
            if (contactList.size() > 1) { 
                //try {
                    Contact masterContact = determineMaster(contactList);
                    List<Contact> duplicates = contactList.clone();
                    
                    for(Integer i=0; i<=(duplicates.size()-1);i++){
                        System.debug(masterContact+' '+masterIndex);
                        System.debug(duplicates[i]+' '+masterIndex);
                    }
                    /*
                    duplicates.remove(masterIndex);
                    Database.MergeResult mergeResult = Database.merge(masterContact, duplicates);

                    if (!mergeResult.isSuccess()) {
                        throw new DuplicateMergeException(mergeResult.getErrors());
                    }
                }
                
                catch (Exception e) {
                    throw new DuplicateMergeException('Merge failed: ' + e.getMessage());
                }
                */
            }
        }
    }
}
/*
feb14PracticeDatabaseMerge.mergeDuplicateContacts();
*/