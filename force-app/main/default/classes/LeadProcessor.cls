public class LeadProcessor implements Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }

    public void execute(Database.BatchableContext context, List<Lead> leads) {
        List<Lead> leadsToUpdate = new List<Lead>();

        for (Lead leadRecord : leads) {
            leadRecord.LeadSource = 'Dreamforce';
            leadsToUpdate.add(leadRecord);
        }

        update leadsToUpdate;
    }

    public void finish(Database.BatchableContext context) {
		System.debug('Done');
    }
}