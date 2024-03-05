TwentyOppRecords t = new TwentyOppRecords();
t.createOpportunities();

feb28MorningDeleteOldClosedLostOpp b = new feb28MorningDeleteOldClosedLostOpp();
Database.executeBatch(b,10);