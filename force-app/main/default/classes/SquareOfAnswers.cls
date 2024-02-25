public with sharing class SquareOfAnswers {
    public static void squareOfValues() {
        Integer priviousValue = 1;
        Integer currentValue=0;
        while(currentValue<=10000){
            currentValue = (priviousValue + 1)*(priviousValue + 1);
            System.debug('('+priviousValue+'+ 1)^2 ='+currentValue);
            priviousValue = currentValue;
        }
    }
}
/*
SquareOfAnswers.squareOfValues();
*/