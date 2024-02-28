public with sharing class feb26Afternoon {
    
    @future(callout=true)
    public static void futureMethod(Id Ids){
    try {
        Order orderId = ([SELECT Validation_Errors__c, Name, IsOrderValid__c, Owner.Email from Order WHERE Id = : Ids LIMIT 1]);
        String subject;
            if(orderId.IsOrderValid__c){
                orderId.Validation_Errors__c = 'Dear ' + orderId.Owner.Name +'\n';
                orderId.Validation_Errors__c += 'Your order is Valid';
                subject ='Order Validated';
                EmailManager.sendMail(orderId.Owner.Email,subject,orderid.Validation_Errors__c);

            }
            else{
                orderId.Validation_Errors__c = 'Dear ' + orderId.Owner.Name +'\n';
                orderId.Validation_Errors__c += ' Order Invalid : \n'+ orderId.Validation_Errors__c;
                subject ='Order Invalid';
                EmailManager.sendMail(orderId.Owner.Email,subject,orderid.Validation_Errors__c);
            }
        }
        catch (Exception e) {
            System.debug('An error occurred: ' + e.getMessage());
        }
    }
}