/**
 * Created by User on 15.11.2019.
 */

public with sharing class AppointmentManager {
    public static Account getAccountByName(String name){
        List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name =: name LIMIT 1];
        if(accounts.size() > 0){
            return accounts.get(0);
        }
        else{
            return null;
        }
    }
}