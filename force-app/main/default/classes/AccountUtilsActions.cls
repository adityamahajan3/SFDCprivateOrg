public with sharing class AccountUtilsActions {

    @InvocableMethod(label = 'Get Account Info: ' description = 'Get Contacts and Opportunities')
    public static List<ActionResult> getContactsandOpptys (List<ActionRequest> inputs){
        List<ActionResult> results = new List<ActionResult>();
        for(ActionRequest request : inputs){
            results.add(invoke(request));
        }
        return results;
    }
    private static ActionResult invoke(ActionRequest input){
        List<Contact> contacts	= [select id, name from Contact where accountId = :input.accountId limit 5];
        List<Opportunity> opportunities = [select Id, name from opportunity where accountId = :input.accountId limit 5];
        ActionResult result = new ActionResult();
        result.contacts = contacts;
        result.opportunities = opportunities;
        return result;            
    }
    public class ActionRequest {
        @InvocableVariable(label = 'Account Id' required = true)
        public Id accountId;
    }
    public class ActionResult {
        @InvocableVariable(label = 'List of Contact')
        public List<Contact> contacts;
        @InvocableVariable(label = 'List of Opportunities')
        public List<Opportunity> opportunities;
    }
}