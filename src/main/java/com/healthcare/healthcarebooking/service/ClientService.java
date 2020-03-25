package com.healthcare.healthcarebooking.service;

import com.healthcare.healthcarebooking.entities.Client;
import com.healthcare.healthcarebooking.entities.Contact;
import com.healthcare.healthcarebooking.features.HealthCareBookingFeatures;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientService {

    @Autowired
    private HealthCareBookingFeatures<Client> healthCareBookingFeatures;

    @Transactional
    public void createCustomerReservation(Client client) {
        healthCareBookingFeatures.createCustomerReservation(client);
    }

    public Client loginProcessing(Client client) {
        return healthCareBookingFeatures.loginProcessing(client);
    }

    @Transactional
    public void cancelReservation(String email) {
        healthCareBookingFeatures.cancelReservation(email);
    }

    @Transactional
    public void updateCustomerReservation(Client client) {
        healthCareBookingFeatures.updateCustomerReservation(client);
    }

    @Transactional
    public void contactUs(Contact contact) {
        healthCareBookingFeatures.contactUs(contact);
    }
}
