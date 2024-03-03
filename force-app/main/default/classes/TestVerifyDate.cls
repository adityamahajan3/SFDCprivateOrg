@isTest
private class TestVerifyDate {

    // Test 'DateWithin30Days' - Check for date2 in the past
    @isTest static void testDateWithin30Days_PastDate() {
        Date date1 = Date.today();
        Date date2 = date1.addDays(-10); // date2 in the past 
        Boolean result = VerifyDate.DateWithin30Days(date1, date2);
        System.assertEquals(false, result);
    }

    // Test 'DateWithin30Days' - Check within next 30 days
    @isTest static void testDateWithin30Days_WithinRange() {
        Date date1 = Date.today();
        Date date2 = date1.addDays(20);  // date2 within the next 30 days
        Boolean result = VerifyDate.DateWithin30Days(date1, date2);
        System.assertEquals(true, result);
    }

    // Test 'DateWithin30Days' - Check for date2 outside 30 days
    @isTest static void testDateWithin30Days_OutsideRange() {
        Date date1 = Date.today();
        Date date2 = date1.addDays(35); // date2 outside 30 days
        Boolean result = VerifyDate.DateWithin30Days(date1, date2);
        System.assertEquals(false, result);
    }

    // Test 'CheckDates' - date2 within 30 days  
    @isTest static void testCheckDates_Within30Days() {
        Date date1 = Date.today();
        Date date2 = date1.addDays(15); 
        Date resultDate = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, resultDate);
    }

    // Test 'CheckDates' - date2 outside 30 days 
    @isTest static void testCheckDates_Outside30Days() {
        Date date1 = Date.today();
        Date date2 = date1.addDays(40); 
        Date expectedDate = date1.toStartOfMonth().addMonths(1).addDays(-1); // End of the month
        Date resultDate = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(expectedDate, resultDate);
    } 

}
