public without sharing class AccountTriggerHelper {
    /*Write a trigger, when a new Account is created then create a contact related to that account. */
    public static void createOneContactForEveryAccount(List<Account> newAcc) {
        List<Contact> conList = new List<Contact>();
        for(Account a:newAcc){
            Contact c = new Contact();
            c.FirstName=a.Name;
            c.LastName=' Added via trigger';
            c.AccountId=a.Id;
            conList.add(c);
        }
        insert conList;
    }
    /*Write a trigger, if the owner of an account is changed then the owner for the related contacts should also be updated. */
    public static void makeContactOwnerSameAsAccount(List<Account> newAcc){
        List<Contact> conList = new List<Contact>();
        for(Account a : newAcc){
            Contact c = new Contact();
            if(c.AccountId!=null){
                c.Owner = a.Owner;
                conList.add(c);
            }
        }
        update conList;
    }
    /*Write a trigger, to create new Opportunity whenever an account is created/updated for Industry – Agriculture. */
    public static void newOppWhenIndustryAgriAccountCreatedOrUpdated(List<Account> newAcc){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account a : newAcc){
            if(a.Industry=='Agriculture'){
                Opportunity o = new Opportunity();
                o.Name = a.Name+' Created because industry is agri';
                oppList.add(o);
            }
        }
        insert oppList;
    }
}