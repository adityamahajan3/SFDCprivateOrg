public class DateTimeDemo {
    public Date getTodayDate() {
        // Get the current date
        Date d = Date.today();
        return d;
    }

    public Time getCurrentTime() {
        // Get the current time
        Time t1 = Time.newInstance(DateTime.now().hour(),DateTime.now().minute(),DateTime.now().second(),DateTime.now().millisecond());
        return t1;
    }
}
/*
DateTimeDemo dtd = new DateTimeDemo();
System.debug(dtd.getTodayDate());
System.debug(dtd.getTodayDate().now().format());

//without static keyword
System.debug(DateTimeDemo.getTodayDate());
System.debug(DateTimeDemo.getCurrentTime().now().format());
 */