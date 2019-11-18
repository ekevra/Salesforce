@IsTest
private class AppointmentTriggerHandlerTest {

    @isTest
    private static void relateToAccountTest() {
        getAccounts();

        Test.startTest();
        AppointmentTriggerHandler appointmentTriggerHandler = new AppointmentTriggerHandler();
        appointmentTriggerHandler.relateToAccount(getAppointments());
        Test.stopTest();

        List<Appointment__c> appointments = [SELECT Id, Name, Account__c FROM Appointment__c];
        Account accountBob = [SELECT Name, Appointment__c FROM Account WHERE Name =: 'Bob'];
        System.assertEquals(appointments.get(0).Account__c, accountBob.Id);
        Account accountMaggy = [SELECT Name, Appointment__c FROM Account WHERE Name =: 'Maggy'];
        System.assertEquals(accountMaggy.Name, 'Maggy');
        System.assertEquals(appointments.get(1).Account__c, accountMaggy.Id);
    }

    private static List<Appointment__c> getAppointments(){
        List<Appointment__c> appointments = new List<Appointment__c>();
        appointments.add(new Appointment__c(Name = 'The first', Account_Name__c = 'Bob'));
        appointments.add(new Appointment__c(Name = 'The second', Account_Name__c = 'Maggy'));

        insert appointments;
        return appointments;
    }

    private static void getAccounts(){
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name = 'Bob'));
        accounts.add(new Account(Name = 'Alice'));
        accounts.add(new Account(Name = 'Eve'));

        insert accounts;
    }
}