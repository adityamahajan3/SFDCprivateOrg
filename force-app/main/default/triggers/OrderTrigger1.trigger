trigger OrderTrigger1 on Order (before insert, before update) {
    if(Trigger.isBefore){
        if(Trigger.isUpdate || Trigger.isInsert){
            List<OrderItem> orderItemList = [SELECT Id, Quantity, Product2.Id
                                                        FROM OrderItem
                                                        WHERE orderId = : Trigger.new];
            
            Map<Id, Boolean> validator = new Map<Id, Boolean>(); 
            Map<Id, String> orderError = new Map<Id, String>(); 
            
            for(Order ord: Trigger.new){
                validator.put(ord.Id, True); 
                orderError.put(ord.Id, '');
            }
            
            for(OrderItem orderIL: orderItemList){ 
                if(orderIL.Quantity > orderIL.Product2.Inventory__c){
                    validator.put(orderIL.OrderId, False); 
                    orderError.put(orderIL.OrderId,orderError.get(orderIL.Id) + 'Order ' + orderIL.Id + ' failed as inventory is less\n');
                }
                if(orderIL.Product2Id == null || !Pattern.matches('PROD-\\d{4}', orderIL.Product2.ProductCode)){
                    validator.put(orderIL.OrderId, False); 
                    orderError.put(orderIL.OrderId,orderError.get(orderIL.Id) + 'Order failed ' + orderIL.Id + ' ProductId Does not Match Pattern PROD-0000\n');
                }
                if(orderIL.Quantity < 1){
                    validator.put(orderIL.Id, False); 
                    orderError.put(orderIL.Id,orderError.get(orderIL.Id) + 'Order ' + orderIL.OrderId + 'Quantity should be atleat 1\n');
                }
            }
            for(Order order: Trigger.new){
                order.IsOrderValid__c = validator.get(order.Id); 
                if(orderError.get(order.id) != null)
                    order.Validation_Errors__c = orderError.get(order.id); 
                    feb26Afternoon.futureMethod(order.Id); 
            }
            
            System.debug('Validate map: '+validator); 
            update orderItemList; 
        }
    }
}