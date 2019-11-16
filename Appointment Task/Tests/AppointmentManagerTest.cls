/**
 * Created by User on 15.11.2019.
 */

@IsTest
private class AppointmentManagerTest {

    @isTest
    private static void testGetAccountByName() {
        List<Account> testAccounts = testAccounts();

        Test.startTest();
        Account account1 = AppointmentManager.getAccountByName('Bob');
        Account account2 = AppointmentManager.getAccountByName('Maggy');
        Test.stopTest();

        System.assertEquals(account1, testAccounts.get(0));
        System.assertEquals(account2, null);
    }

    private static List<Account> testAccounts(){
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name = 'Bob'));
        accounts.add(new Account(Name = 'Alice'));
        accounts.add(new Account(Name = 'Eve'));

        insert accounts;
        return accounts;
    }
}