/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.controller;

import com.app.model.Dipendenti;
import com.app.model.User;
import com.app.service.DipendentiService;
import com.app.service.UserService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author roman
 */
@Controller
@RequestMapping("/admin")
@ComponentScan("com.app.service")
public class AdminController {

    @Autowired
    DipendentiService serviceDip;

    @Autowired
    UserService serviceUser;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
        List<Dipendenti> dipendenti = serviceDip.findAll();
        model.addAttribute("dipendenti", dipendenti);
        return "adminHome";
    }

    @RequestMapping(value = "/insertDip", method = GET)
    public String insertDip(ModelMap model, @RequestParam(value = "error") String error) {
        model.addAttribute("dip", new Dipendenti());
        model.addAttribute("user", new User());
        if (error != null) {
            model.addAttribute("error", error);
        }
        return "insertdip";
    }

    @RequestMapping(value = "/addDip", method = POST)
    public String addDip(ModelMap model, @Valid
            @ModelAttribute(value = "dip") Dipendenti dip, BindingResult bindDip,
            @ModelAttribute(value = "user") User user, BindingResult bindUser) {

        if (bindUser.hasErrors() || bindDip.hasErrors()) {
            model.addAttribute("error", bindUser.getAllErrors() + "<br/>" + bindDip.getAllErrors());
            return "/admin/insertDip";
        }
        serviceDip.saveDipedenti(dip);
        serviceUser.addUser(user);
        return "redirect:/admin/home";
    }

    @RequestMapping(value = "/deleteDip", method = POST)
    public String deleteDip(ModelMap model, @RequestParam(value = "matricola") int matricola) {
        serviceDip.deleteDipendenti(matricola);
        return "redirect:/admin/home";
    }
}
