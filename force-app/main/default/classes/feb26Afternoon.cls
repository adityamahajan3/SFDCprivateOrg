public with sharing class feb26Afternoon {
    @future
    public static void futureMethod(Id orderId){
        List<Custom_Order__c> orderList = ([Select Validation_Errors__c, Name, IsOrderValid__c, Owner.Email from Custom_Order__c where Id = : orderId]);
        For(Integer i=0;i<orderList.size();i++){
            if(orderList[i].IsOrderValid__c){
                orderList[i].Validation_Errors__c = 'Dear ' + orderList[i].Owner.Name +'\n';
                orderList[i].Validation_Errors__c += 'Your order is Valid';
            }
            else if(orderList[i].IsOrderValid__c == false){
                orderList[i].Validation_Errors__c = 'Dear ' + orderList[i].Owner.Name +'\n';
                orderList[i].Validation_Errors__c += ' Order Invalid : \n'+ orderList[0].Validation_Errors__c;
            }
            EmailManager.sendMail(orderList[i].Owner.Email,'Validation Status',orderList[i].Validation_Errors__c);
        }
    }
}