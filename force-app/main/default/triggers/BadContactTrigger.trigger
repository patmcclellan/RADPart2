trigger BadContactTrigger on Contact(after insert, before update, after update, after delete) {
    if (Trigger.isInsert && Trigger.isAfter) {
        Integer recordCount = newContacts.size();
        // Call a utility method from another class
        EmailManager.sendMail(
            'putYourEmail@here.com',
            'RAD Sample code',
            recordCount + ' contact(s) were inserted.'
        );
    } else if (Trigger.isDelete && Trigger.isAfter) {
        Integer recordCount = deletedContacts.size();
        // Call a utility method from another class
        EmailManager.sendMail(
            'putYourEmail@here.com',
            'RAD Sample code',
            recordCount + ' contact(s) were deleted.'
        );
    }
}