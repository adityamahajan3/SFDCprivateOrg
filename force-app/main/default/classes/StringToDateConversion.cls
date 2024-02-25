public with sharing class StringToDateConversion {
    public static Date ParsedDate (String DateString) {
        String values;
        String month;
        String year;
        String day;
        for(integer i = 0; i < DateString.length(); i++) {
            if(i<4) {
                year = DateString.substring(0,4);
            } 
            if(i>=4 && i<=5) {
                month = DateString.substring(4,6);
            } 
            if(i>=6 && i<=7) {
                day = DateString.substring(6,8);
            }   
        }
        Date mydate = Date.newInstance(integer.valueOf(year),integer.valueOf(month),integer.valueOf(day));
        return mydate;
    }
}