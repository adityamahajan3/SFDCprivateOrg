public class DemoObject {

    private static final Integer DEFAULT_SIZE = 10;
    
    Integer size;
    
       
       public DemoObject() {
           this(DEFAULT_SIZE); // Using this(...) calls the one argument constructor    
       }
    
       public DemoObject(Integer ObjectSize) {
         size = ObjectSize;  
       }
    }