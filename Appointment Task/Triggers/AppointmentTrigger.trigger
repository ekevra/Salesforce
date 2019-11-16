/**
 * Created by User on 15.11.2019.
 */

trigger AppointmentTrigger on Appointment__c (after insert) {

    AppointmentTriggerHandler appointmentTriggerHandler = new AppointmentTriggerHandler();
    appointmentTriggerHandler.relateToAccount(Trigger.new);
}