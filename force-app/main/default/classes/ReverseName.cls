public with sharing class ReverseName {
    public static void RevName() {
        List<Account> acc = [SELECT Name FROM Account LIMIT 1];
        String accName = acc[0].Name;
        String reverseAccName = '';
        for(Integer i=accName.length()-1;i>=0;i--){
            reverseAccName = reverseAccName + accName.substring(i,i+1);
        }
        System.debug('Original Account Name: '+acc[0].Name);
        System.debug('Reversed Account Name: '+reverseAccName);
    }
}

        /*
        ReverseName.RevName();
        */