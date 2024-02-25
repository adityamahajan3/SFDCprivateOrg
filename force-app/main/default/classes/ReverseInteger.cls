public class ReverseInteger{
    public static void reverse(){
        Integer revInt=0;
        Integer originalInt = 123456789;
        System.debug(originalInt);
        while (originalInt > 0) {
    
            revInt = Math.mod(originalInt, 10) + revInt * 10;
            originalInt = Integer.valueOf(originalInt / 10);
        }
        System.debug(revInt);
    }
}
/*
ReverseInteger.reverse();
 */