String cronExp = '0 0 10 1 * ?'; // Run on the 1st of every month at 10 AM
Mar7UpdateAllOppMonthly m = new Mar7UpdateAllOppMonthly();
System.schedule('Opportunity Monthly Update', cronExp, m);