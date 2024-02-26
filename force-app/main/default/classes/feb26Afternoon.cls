public with sharing class feb26Afternoon {
    public static void validateOrders(List<Custom_Order__c> orders) {
        for (Custom_Order__c order : orders) {
            Boolean isOrderValid = true;
            List<String> errorMessages = new List<String>();

            for (Custom_OrderItem__c orderItem : [SELECT Id, Quantity__c, Product__r.ProductCode, Product__r.Inventory__c FROM Custom_OrderItem__c WHERE Custom_Order__c = :order.Id]) {
                // Validate Inventory on Product2
                if (orderItem.Product__r.Inventory__c <= 0) {
                    isOrderValid = false;
                    errorMessages.add('Stock not available for Product: ' + orderItem.Product__r.ProductCode);
                }

                // Validate Product ID using Regex
                if (!Pattern.matches('PROD-\\d{4}', orderItem.Product__r.ProductCode)) {
                    isOrderValid = false;
                    errorMessages.add('Invalid Product ID pattern for Product: ' + orderItem.Product__r.ProductCode);
                }

                // Validate Quantity
                if (orderItem.Quantity__c <= 0) {
                    isOrderValid = false;
                    errorMessages.add('Quantity should be greater than zero for Product: ' + orderItem.Product__r.ProductCode);
                }
            }

            // Set Order validation status and error messages
            order.IsOrderValid__c = isOrderValid;
            order.Validation_Errors__c = String.join(errorMessages, '\n');

            // If validation fails, invoke future method
            if (!isOrderValid) {
                feb26Afternoon.sendValidationEmailFusture(order.Id);
            }
        }
    }

    @future
    public static void sendValidationEmailFusture(Id orderId) {
        Custom_Order__c order = [SELECT Id, name, Owner.Name, IsOrderValid__c, Validation_Errors__c FROM Custom_Order__c WHERE Id = :orderId];
        if (!order.IsOrderValid__c) {
            // Construct email message
            String emailMessage = 'Dear ' + order.Owner.Name + ',\n\n';
            emailMessage += 'Order (' + order.name + ') is INVALID.\n\n';
            emailMessage += 'Validation Errors:\n' + order.Validation_Errors__c;

            // Send the email
            EmailManager.sendMail(order.Owner.Email, 'Order Invalid', emailMessage);
        }
    }
}