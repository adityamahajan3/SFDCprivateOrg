public with sharing class Fibonacci{
    public Fibonacci(Integer upto) {
        Integer n1 = 0, n2 = 1, n3;
        System.debug('Fibonacci Series up to '+upto);
        for (Integer i = 1; i < 100; i++) {
            if(n2<=upto){
                System.debug(n2);
                n3 = n2 + n1;
                n1 = n2;
                n2 = n3;
            }
        }
    }
}
/*
Fibonacci(10);
*/