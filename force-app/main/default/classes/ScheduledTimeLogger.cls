public class ScheduledTimeLogger implements Schedulable {
    public void execute(SchedulableContext context) {
        // Log the current date and time
        System.debug('Current Date and Time: ' + Datetime.now());

        // Reschedule the job to run again in 5 minutes
        
    }
}
/*
ScheduledTimeLogger logger = new ScheduledTimeLogger();
String jobName = 'ScheduledTimeLogger' + System.currentTimeMillis();
        String cronExpr = '0 0,5,10,15,20,25,30,35,40,45,50,55 * * * ?'; // Run every 5 minutes
        Id jobId = System.schedule(jobName, cronExpr, logger);
        System.debug('Next job scheduled with ID: ' + jobId);
 */