public with sharing class ExecuteFromScript {
    public void efs() {
        System.debug('20 Accounts inserted into Accounts Object');
        TwentyAccountRec a = new TwentyAccountRec();
        a.InsertAccounts();//non-static method - void return type

        System.debug('Class Welcome2Sfdc');
        Welcome2Sfdc w = new Welcome2Sfdc();
        w.printWelcome();//non-static method - void return type

        System.debug('Class UserInformation');
        UserInformation ui = new UserInformation();
        ui.displayUserInfo();//non-static method - void return type

        System.debug('Class ReverseName');
        ReverseName.RevName();//because defined method is static - void return type

        System.debug('Class fibonacci');
        Fibonacci f = new Fibonacci(10);//no method to class called directly from the constructor   
    }
}
/*
ExecuteFromScript e = new ExecuteFromScript();
e.efs();
*/