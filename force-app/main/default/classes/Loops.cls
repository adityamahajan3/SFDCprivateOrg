public class Loops{
    public void differentTypesOfLoops() {
        // Declare the loop variables
        Integer counter1 = 1;
        
        // Do-While Loop
        do {
            System.debug('Do-While Loop Counter: ' + counter1);
            // Condition to continue the loop
            counter1 =counter1+1;
        } while (counter1 <= 3);
        
        // While Loop
        Integer counter2 = 1;
        while (counter2 <= 3) {
            System.debug('While Loop Counter: ' + counter2);
            counter2=counter2+1;
        }
        
        // For Loop
        for (Integer i = 0; i < 3; i++) {
            System.debug('For Loop Counter: ' + i);
        }
        
        // For Each Loop
        List<String> colors = new List<String>{'Red', 'Green', 'Blue'};
        for (String color : colors) {
            System.debug('For Each Loop Color: ' + color);
        }
    }
}
/*
Loops l1 = new Loops();
l1.differentTypesOfLoops();
*/