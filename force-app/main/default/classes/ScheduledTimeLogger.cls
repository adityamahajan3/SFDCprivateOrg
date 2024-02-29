public class ScheduledTimeLogger implements Schedulable {
    public void execute(SchedulableContext context) {
        System.debug('Current Date and Time: ' + Datetime.now()); 
        String cronExpr = '0 */5 * * * ?'; // Run every 5 minutes
        String jobName = 'ScheduledTimeLogger'+ System.currentTimeMillis(); //to create a unique name every time a job is scheduled
        System.schedule(jobName, cronExpr, this);// Reschedule job to run in 5 minutes
    }
}
