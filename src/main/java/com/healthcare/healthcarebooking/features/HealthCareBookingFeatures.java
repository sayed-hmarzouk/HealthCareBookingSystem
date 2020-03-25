package com.healthcare.healthcarebooking.features;

import com.healthcare.healthcarebooking.entities.Client;
import com.healthcare.healthcarebooking.entities.Contact;

public interface HealthCareBookingFeatures<T> {

    public void createCustomerReservation(Client client);

    public Client loginProcessing(Client client);

    public void updateCustomerReservation(Client client);

    public void cancelReservation(String email);

    public void contactUs(Contact contact);
}
