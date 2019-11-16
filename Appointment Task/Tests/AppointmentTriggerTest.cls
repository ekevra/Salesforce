/**
 * Created by User on 15.11.2019.
 */

@IsTest
private class AppointmentTriggerTest {

    @isTest
    private static void testTrigger(){

        getAccounts();
        Appointment__c appointment1 = new Appointment__c(Name = 'The first', Account_Name__c = 'Bob');
        Appointment__c appointment2 = new Appointment__c(Name = 'The second', Account_Name__c = 'Maggy');

        Test.startTest();
            insert appointment1;
            insert appointment2;
        Test.stopTest();

        List<Account> accounts = [SELECT Name, Appointment__c FROM Account WHERE Name =: 'Maggy'];
        System.assertNotEquals(accounts.size(), 0);
        System.assertEquals(accounts.get(0).Name, 'Maggy');
        Account account = [SELECT Name, Appointment__c FROM Account WHERE Name =: 'Bob'];
        System.assertEquals(account.Appointment__c, appointment1.Id);
        }

    private static void getAccounts(){
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name = 'Bob'));
        accounts.add(new Account(Name = 'Alice'));
        accounts.add(new Account(Name = 'Eve'));

        insert accounts;
    }
}