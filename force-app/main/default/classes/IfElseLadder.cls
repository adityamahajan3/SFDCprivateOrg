public class IfElseLadder {
    public static void ifElseLadderExample() {
        // If-else ladder
        Integer age = 20;
        if (age > 18) {
            System.debug('Age is above 18.');
        } else if (age < 18 && age > 0) { 
            System.debug('Age is between 0 and 18.');
        } else {
            System.debug('Age is not above 0.');
        }
    }
}