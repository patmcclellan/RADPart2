public with sharing class ContactTriggerHandler {
   
    public static void onAfterInsert(List<Contact> newContacts) {
        Integer recordCount = newContacts.size();
        // Call a utility method from another class
        EmailManager.sendMail(
            'putYourEmail@here.com',
            'RAD Sample code',
            recordCount + ' contact(s) were inserted.'
        );
    }

    public static void onAfterDelete(List<Contact> deletedContacts) {
        Integer recordCount = newContacts.size();
        // Call a utility method from another class
        EmailManager.sendMail(
            'putYourEmail@here.com',
            'RAD Sample code',
            recordCount + ' contact(s) were deleted.'
        );
    }

}
