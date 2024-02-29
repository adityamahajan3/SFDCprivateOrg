public class ScheduledTimeLogger implements Schedulable {
    public void execute(SchedulableContext context) {
         
        String cronExpr = '0 */5 * * * ?'; // Run every 5 minutes
        String jobName = 'ScheduledTimeLogger'+ System.currentTimeMillis(); //to create a unique name every time a job is scheduled
        Id jobId = System.schedule(jobName, cronExpr, this);// Reschedule job to run in 5 minutes
        System.debug('Current Date and Time: ' + Datetime.now()+'next job scheduled');
    }
}
/*
ScheduledDebugLogger scheduledJob = new ScheduledDebugLogger();
String cronExp = '0 0/5 * * * ?'; // Every 5 minutes
String jobId = system.schedule('ScheduledDebugLoggerJob', cronExp, scheduledJob);
System.debug('Job Id: ' + jobId);
 */