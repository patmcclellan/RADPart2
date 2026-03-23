/*
Source Code:https://trailhead.salesforce.com/en/content/learn/modules/apex_triggers/apex_triggers_intro
*/

trigger ContactTrigger on Contact(after insert, before update, after update, after delete) {
    if (Trigger.isInsert) {
        ContactTriggerHandler.onAfterInsert(Trigger.New);
    } else if (Trigger.isDelete) {
        ContactTriggerHandler.onAfterDelete(Trigger.Old);
    }
}
