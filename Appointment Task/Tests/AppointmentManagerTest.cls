@IsTest
private class AppointmentManagerTest {

    @isTest
    private static void testGetAccountByName() {
        testAccounts();

        List<String> testStrings1 = new List<String>{'123','Bob','Maggy'};
        List<String> testStrings2 = new List<String>{'123','','Maggy'};
        List<String> testStrings3 = new List<String>{null,'Bob','Maggy'};

        Test.startTest();
        List<Account> accounts1 = AppointmentManager.getAccountsFromListOfNames(testStrings1);
        List<Account> accounts2 = AppointmentManager.getAccountsFromListOfNames(testStrings2);
        List<Account> accounts3 = AppointmentManager.getAccountsFromListOfNames(testStrings3);
        Test.stopTest();

        System.assertNotEquals(accounts1, null);
        System.assertEquals(accounts1.size(), 2);
        System.assertEquals(accounts2, null);
        System.assertEquals(accounts3, null);
    }

    private static void testAccounts(){
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name = 'Bob'));
        accounts.add(new Account(Name = 'Maggy'));
        accounts.add(new Account(Name = 'Eve'));

        insert accounts;
    }
}