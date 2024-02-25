public class UpperCaseContacts {
    public void UpperCaseSingleChar(){
        List <Contact> conList = [SELECT  FirstName,LastName FROM Contact LIMIT 50];
        for (Contact con :conList){
            String fname = '';
            String lname = '';
            If(con.FirstName==null){
                lname = con.LastName.substring(0,1).toUpperCase()+/*CONVERTS THE FIRST CHAR TO UPPER CASE */ + con.LastName.substring(1).toLowerCase();/*RETURNS THE SRTING LEFT AFTER THE INDEX 1 TO LOWER CASE */
                System.debug('ONLY LAST NAME: '+lname);
            }
            else{
                fname =  (con.FirstName.substring(0,1)).toUpperCase() + con.FirstName.substring(1).toLowerCase();
                lname = (con.LastName.substring(0,1)).toUpperCase() + con.LastName.substring(1).toLowerCase();
                System.debug(fname+' '+lname);
            }
        }
    }
} 
/*
UpperCaseContacts u = new UpperCaseContacts();
u.UpperCaseSingleChar();
 */