package com.healthcare.healthcarebooking.entities;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Client implements Serializable {

    @Id
    @Column(nullable = false, unique = true)
    @Email(regexp = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$", message = "{ErrorMessage.email.Email}")
    private String email;
    @NotEmpty(message = "{ErrorMessage.fullName.NotEmpty}")
    private String fullName;
    @NotNull(message = "{ErrorMessage.appointmentDate.NotNull}")
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @FutureOrPresent(message = "{ErrorMessage.appointmentDate.NotPast}")
    private LocalDate appointmentDate;
    @NotEmpty(message = "{ErrorMessage.message.NotEmpty}")
    private String message;

    public Client() {
    }

    public Client(String message) {
        this.message = message;
    }

    public Client(String email, String fullName, LocalDate appointmentDate, String message) {
        this.email = email;
        this.fullName = fullName;
        this.appointmentDate = appointmentDate;
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

    public LocalDate getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(LocalDate appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "Client{" + "email=" + email + ", fullName=" + fullName + ", appointmentDate=" + appointmentDate + ", message=" + message + '}';
    }

}
