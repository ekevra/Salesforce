trigger AppointmentTrigger on Appointment__c (before insert) {

    List<Appointment__c> newAppointments = new List<Appointment__c>();
    for(Appointment__c appointment : Trigger.new){
        if(appointment.Account_Name__c == null || appointment.Account_Name__c == ''){
            appointment.addError('Account Name field is empty. Please fill it out.');
        }
        else{
            newAppointments.add(appointment);
        }
    }
    AppointmentTriggerHandler appointmentTriggerHandler = new AppointmentTriggerHandler();
    appointmentTriggerHandler.relateToAccount(newAppointments);
}