/**
 * Created by User on 15.11.2019.
 */

public with sharing class AppointmentTriggerHandler {

    public void relateToAccount(List<Appointment__c> appointments){

        for(Appointment__c appointment : appointments){
            Account account = AppointmentManager.getAccountByName(appointment.Account_Name__c);
            if(account != null){
                account.Appointment__c = appointment.Id;
                update account;
            }
            else{
                Account newAccount = new Account(Name = appointment.Account_Name__c, Appointment__c = appointment.Id);
                insert newAccount;
            }
        }
    }
}