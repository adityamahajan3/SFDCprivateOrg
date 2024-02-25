public with sharing class Calculator {
        public static Integer addition(Integer a,Integer b){
            return a+b;
        }
        public static Integer subtract(Integer a,Integer b){
            return a-b;
        }
        public static Integer multiply(Integer a,Integer b){
            return a*b;
        }
        public static Decimal divide(Integer a,Integer b){
            if(b==0){
                return null;
            }
            else {
                return (Decimal)a/b;   
            }
        }
}
/* to call a non ststic method
ClassName clsObj = new ClassName();
clsObj.methodName();


*/