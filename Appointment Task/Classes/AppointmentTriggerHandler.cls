public class AppointmentTriggerHandler {

    public void relateToAccount(List<Appointment__c> appointments) {
        List<String> namesOfAccounts = new List<String>();
        for (Appointment__c appointment : appointments) {
            namesOfAccounts.add(appointment.Account_Name__c);
        }
        List<Account> accounts = AppointmentManager.getAccountsFromListOfNames(namesOfAccounts);
        List<Account> newAccounts = new List<Account>();

        Boolean isEquals = false;
        for (Appointment__c appointment : appointments) {
            for(Account account : accounts){
                if(appointment.Account_Name__c.equals(account.Name)){
                    appointment.Account__c = account.Id;
                    isEquals = true;
                    break;
                }
            }
            if(isEquals == false){
                newAccounts.add(new Account(Name = appointment.Account_Name__c));
            }
            isEquals = false;
        }

        insert newAccounts;

        Integer i = 0;
        for(Appointment__c appointment : appointments){
            if(appointment.Account__c == null){
                appointment.Account__c = newAccounts.get(i).Id;
                i++;
            }
        }
    }
}