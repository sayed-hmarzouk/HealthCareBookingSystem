package com.healthcare.healthcarebooking.repository;

import com.healthcare.healthcarebooking.entities.Client;
import com.healthcare.healthcarebooking.entities.Contact;
import com.healthcare.healthcarebooking.features.HealthCareBookingFeatures;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class ClientRepository implements HealthCareBookingFeatures<Client> {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void createCustomerReservation(Client client) {
        entityManager.persist(client);
    }

    @Override
    public Client loginProcessing(Client client) {
        TypedQuery<Client> query = entityManager.createQuery("SELECT c FROM Client c WHERE c.fullName=:fullName AND c.email=:email", Client.class);
        query.setParameter("fullName", client.getFullName());
        query.setParameter("email", client.getEmail());
        return query.getSingleResult();
    }

    @Override
    public void cancelReservation(String email) {
        Client client = entityManager.find(Client.class, email);
        entityManager.remove(client);
    }

    @Override
    public void updateCustomerReservation(Client client) {
        Client c = entityManager.find(Client.class, client.getEmail());
        entityManager.merge(client);
    }

    @Override
    public void contactUs(Contact contact) {
        entityManager.persist(contact);
    }
}
