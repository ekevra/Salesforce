/**
 * Created by User on 15.11.2019.
 */

@IsTest
private class AppointmentTriggerHandlerTest {

    @isTest
    private static void relateToAccountTest() {
        getAccounts();
        List<Appointment__c> appointments = getAppointments();

        Test.startTest();
        AppointmentTriggerHandler appointmentTriggerHandler = new AppointmentTriggerHandler();
        appointmentTriggerHandler.relateToAccount(appointments);
        Test.stopTest();

        List<Account> accounts = [SELECT Name, Appointment__c FROM Account WHERE Name =: 'Maggy'];
        System.assertNotEquals(accounts.size(), 0);
        System.assertEquals(accounts.get(0).Name, 'Maggy');
        Account account = [SELECT Name, Appointment__c FROM Account WHERE Name =: 'Bob'];
        Id appointmentId = appointments.get(0).Id;
        System.assertEquals(account.Appointment__c, appointmentId);
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