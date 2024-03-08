public with sharing class feb26Afternoon {
    @future(callout=true)
    public static void futureMethod(Id Ids){
        try {
            List<Order> orders = ([SELECT Id, Validation_Errors__c, Name, IsOrderValid__c, Owner.Email, Owner.Name from Order WHERE Id = : Ids]);
            System.debug(orders);
            String subject;
            String body;
            for(Order ord :orders){
                if(ord.IsOrderValid__c){
                    body = 'Dear '+ord.Owner.Name+', \n';
                    body+= 'Your order is Valid';
                    subject ='Order Validated';
                    EmailManager.sendMail(ord.Owner.Email,subject,body);
                }
                else{
                    body = 'Dear'+ord.Owner.Name+', \n';
                    body+= ' Order Invalid : \n'+ ord.Validation_Errors__c;
                    subject ='Order Invalid';
                    System.debug(body);
                    EmailManager.sendMail(ord.Owner.Email, subject ,body);
                }
            }
        }
        catch (Exception e) {
            System.debug('An error occurred: ' + e.getMessage());
        }
    }
}