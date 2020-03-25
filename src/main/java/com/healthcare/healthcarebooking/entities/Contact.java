package com.healthcare.healthcarebooking.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

@Entity
public class Contact implements Serializable {

    @Id
    @Column(nullable = false)
    @Email(regexp = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$", message = "{ErrorMessage.email.Email}")
    private String email;
    @NotEmpty(message = "{ErrorMessage.fullName.NotEmpty}")
    private String fullName;
    @NotEmpty(message = "{ErrorMessage.message.NotEmpty}")
    private String message;

    public Contact() {
    }

    public Contact(String message) {
        this.message = message;
    }

    public Contact(String email, String fullName, String message) {
        this.email = email;
        this.fullName = fullName;
        this.message = message;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "Contact{" + "email=" + email + ", fullName=" + fullName + ", message=" + message + '}';
    }

}
