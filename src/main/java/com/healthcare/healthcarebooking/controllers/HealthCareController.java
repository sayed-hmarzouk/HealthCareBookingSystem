package com.healthcare.healthcarebooking.controllers;

import com.google.gson.Gson;
import com.healthcare.healthcarebooking.entities.Client;
import com.healthcare.healthcarebooking.entities.Contact;
import com.healthcare.healthcarebooking.service.ClientService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.ws.rs.core.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HealthCareController {

    @Autowired
    private ClientService clientService;
    @Autowired
    private MessageSource messageSource;

    @GetMapping(value = {"/", "/home"})
    public String homePageHandler(@ModelAttribute("clientReserver") Client client, @ModelAttribute("contactUs") Contact contact) {
        return "index";
    }

    @PostMapping(value = {"/reserve"}, produces = MediaType.APPLICATION_JSON)
    @ResponseBody
    public String createReservationPageHandler(@Valid @ModelAttribute("clientReserver") Client client, BindingResult result) {
        Map<String, String> response = new HashMap<>();
        if (result.hasErrors()) {
            List<FieldError> errorMessagesResponse = result.getFieldErrors();
            for (FieldError error : errorMessagesResponse) {
                response.put(error.getField(), error.getDefaultMessage());
            }
            response.put("Message", "SORRY");
            return new Gson().toJson(response);
        } else {
            try {
                System.out.println(client);
                clientService.createCustomerReservation(client);
                response.put("Message", "DONE RESERVED SUCCESSFULLY");
                return new Gson().toJson(response);
            } catch (Exception e) {
                response.put("Message", "Sorry Try With Another Mail Please");
                return new Gson().toJson(response);
            }
        }
    }

    @GetMapping(value = {"/Profile"})
    public String profilePageHandler(@ModelAttribute("clientlogger") Client client, Model model, HttpSession session) {
        if (session.getAttribute("clientlogger") != null) {
            Client c = (Client) session.getAttribute("clientlogger");
            model.addAttribute("clientlogger", c);
        }
        return "profile";
    }

    @PostMapping(value = {"/login"})
    public String loginHandler(@Valid @ModelAttribute("clientlogger") Client client, BindingResult result, Model model, HttpSession session) {
        try {
            Client c = clientService.loginProcessing(client);
            session.setAttribute("clientlogger", c);
            return "redirect:/clientInformation";
        } catch (Exception e) {
            String maileRegex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
            Boolean checker = !client.getFullName().isEmpty() && !client.getEmail().isEmpty() && client.getEmail().matches(maileRegex);
            if (checker) {
                model.addAttribute("SORRY", "Sorry No Reservation For That User");
            }
            return "profile";
        }
    }

    @GetMapping(value = {"/clientInformation"})
    public String clientInformation(@ModelAttribute("clientlogger") Client client, Model model, HttpSession session) {
        if (session.getAttribute("clientlogger") == null) {
            return "redirect:/";
        }
        model.addAttribute("clientlogger", session.getAttribute("clientlogger"));
        return "client-information";
    }

    @GetMapping(value = {"/logout"})
    public String logoutHandler(HttpSession session) {
        session.removeAttribute("clientlogger");
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping(value = {"/cancelReservation"})
    public String cancelHandler(@RequestParam String email, HttpSession session) {
        try {
            clientService.cancelReservation(email);
            session.removeAttribute("clientlogger");
            session.invalidate();
            return "redirect:/";
        } catch (Exception e) {
            return "client-information";
        }
    }

    @PostMapping(value = {"/editReservation"})
    public String editHandler(@Valid @ModelAttribute("clientlogger") Client client, BindingResult result, HttpSession session) {
        try {
            clientService.updateCustomerReservation(client);
            session.setAttribute("clientlogger", client);
            return "redirect:/";
        } catch (Exception e) {
            return "client-information";
        }
    }

    @PostMapping(value = {"/contact"}, produces = MediaType.APPLICATION_JSON)
    @ResponseBody
    public String contactUsHandler(@Valid @ModelAttribute("contactUs") Contact contact, BindingResult result) {
        Map<String, String> response = new HashMap<>();
        if (result.hasErrors()) {
            List<FieldError> errorMessagesResponse = result.getFieldErrors();
            for (FieldError error : errorMessagesResponse) {
                response.put(error.getField(), error.getDefaultMessage());
            }
            response.put("Message", "SORRY");
            return new Gson().toJson(response);
        } else {
            try {
                clientService.contactUs(contact);
                response.put("Message", "MESSAGE SEND SUCCESSFULLY");
                return new Gson().toJson(response);
            } catch (Exception e) {
                response.put("Message", "Sorry Try With Another Mail Please");
                return new Gson().toJson(response);
            }
        }
    }

}
