public class SwitchCaseExample {
    public static Integer casePriority(String priority) {
        Integer result = 0;
        switch on priority {
            when 'High' {
                result = 1;
            }
            when 'Medium' {
                result = 2;
            }
            when 'Low' {
                result = 3;
            }
            when else {
                result = -1;
            }
        }
        return result;
    }
}