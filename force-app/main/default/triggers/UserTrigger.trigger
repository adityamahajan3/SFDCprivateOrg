/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-10-2024
 * @last modified by  : aditya.mahajan@aethereus.com
**/
trigger UserTrigger on User (after insert, after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            UserTriggerHandler.afterInsert(Trigger.newMap);
        }
        if(Trigger.isUpdate){
            UserTriggerHandler.afterUpdate(Trigger.newMap);
        }
    }
}