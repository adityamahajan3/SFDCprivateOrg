public with sharing class feb26Afternoon {
    public static void validateOrders(List<Custom_Order__c> orders) {
        System.debug(orders);
        Boolean isOrderValid = true;
        Set<Id> orderIdSet = new Set<Id>();
        for(Custom_Order__c o : orders){
            orderIdSet.add(o.Id);
        }
        for (Custom_OrderItem__c orderItem : [SELECT Id, Quantity__c, Custom_Order__r.Validation_Errors__c, Custom_Order__r.IsOrderValid__c, Product__r.ProductCode, Product__r.Inventory__c FROM Custom_OrderItem__c WHERE Custom_Order__r.Id IN :orderIdSet ]) {
            orderIdSet.add(orderItem.Id);
            List<String> errorMessages = new List<String>();
            if (orderItem.Product__r != null && orderItem.Product__r.Inventory__c <= 0) {
                isOrderValid = false;
                errorMessages.add('Stock not available for Product: ' + orderItem.Product__r.ProductCode);
                System.debug('Stock not available for Product: ' + orderItem.Product__r.ProductCode);
            }
            if (orderItem.Product__r != null && !Pattern.matches('PROD-\\d{4}', orderItem.Product__r.ProductCode)) {
                isOrderValid = false;
                errorMessages.add('Invalid Product ID pattern for Product: ' + orderItem.Product__r.ProductCode);
                System.debug('Invalid Product ID pattern for Product: ' + orderItem.Product__r.ProductCode);
            }
            if (orderItem.Quantity__c <= 0) {
                isOrderValid = false;
                errorMessages.add('Quantity should be greater than zero for Product: ' + orderItem.Product__r.ProductCode);
                System.debug('Quantity should be greater than zero for Product: ' + orderItem.Product__r.ProductCode);
            }
            if (orderItem.Custom_Order__r != null) {
                orderItem.Custom_Order__r.IsOrderValid__c = isOrderValid;
                orderItem.Custom_Order__r.Validation_Errors__c = String.join(errorMessages, '\n');
            }
        }
        if (!isOrderValid) {
            feb26Afternoon.sendValidationEmailFuture(orderIdSet);
        }
    }

    @future
    public static void sendValidationEmailFuture(Set<Id> orderIdSet) {
        for (Custom_Order__c order : [SELECT Id, name, Owner.Name, Owner.Email, IsOrderValid__c, Validation_Errors__c FROM Custom_Order__c WHERE Id IN :orderIdSet]) {
            if (order != null) {
                String emailAddress = order.Owner.Email;
                String emailMessage = 'Dear ' + order.Owner.Name + ',\n\n';
                emailMessage += 'Order (' + order.name + ') is INVALID.\n\n';
                emailMessage += 'Validation Errors:\n' + order.Validation_Errors__c + '\n';
                if (!order.IsOrderValid__c) {
                    EmailManager.sendMail(emailAddress, 'Order Invalid', emailMessage);
                } else {
                    emailMessage = 'Dear ' + order.Owner.Name + ',\n\n';
                    emailMessage += 'Order (' + order.name + ') is VALID.\n\n';
                    EmailManager.sendMail(emailAddress, 'Order Valid', emailMessage);
                }
            }
        }
    }
}