@IsTest
private class AppointmentTriggerTest {

    @isTest
    private static void testTrigger(){

        getAccounts();
        Appointment__c appointment1 = new Appointment__c(Name = 'The first', Account_Name__c = 'Bob');
        Appointment__c appointment2 = new Appointment__c(Name = 'The second', Account_Name__c = 'Maggy');
        List<Appointment__c> newAppointments = new List<Appointment__c>{appointment1, appointment2};

        Test.startTest();
            insert newAppointments;
        Test.stopTest();

        List<Appointment__c> appointments = [SELECT Id, Name, Account__c FROM Appointment__c];
        System.assertEquals(appointments.size(), 2);
        Account accountBob = [SELECT Name, Appointment__c FROM Account WHERE Name =: 'Bob'];
        System.assertEquals(appointments.get(0).Account__c, accountBob.Id);
        Account accountMaggy = [SELECT Name, Appointment__c FROM Account WHERE Name =: 'Maggy'];
        System.assertEquals(accountMaggy.Name, 'Maggy');
        System.assertEquals(appointments.get(1).Account__c, accountMaggy.Id);
    }

    private static void getAccounts(){
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name = 'Bob'));
        accounts.add(new Account(Name = 'Alice'));
        accounts.add(new Account(Name = 'Eve'));

        insert accounts;
    }
}