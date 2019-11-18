public class AppointmentManager {
    public static List<Account> getAccountsFromListOfNames(List<String> namesOfAccounts) {
        Boolean isValidNames = true;
        for(String name : namesOfAccounts){
            if(name == null || name == ''){
                isValidNames = false;
                break;
            }
        }
        if(isValidNames){
            return [SELECT Id, Name FROM Account WHERE Name IN : namesOfAccounts];
        }
        else{
            return null;
        }
    }
}