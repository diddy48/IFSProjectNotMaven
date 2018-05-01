/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.controller;

import com.app.model.Dipendenti;
import com.app.model.User;
import com.app.model.UserRole;
import com.app.service.DipendentiService;
import com.app.service.UserRoleService;
import com.app.service.UserService;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
    
    @Autowired 
    UserRoleService serviceUserRole;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
        List<Dipendenti> dipendenti = serviceDip.findAll();
        model.addAttribute("dipendenti", dipendenti);
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        return "adminHome";
    }

    @RequestMapping(value = "/insertDip", method = GET)
    public String insertDip(ModelMap model, @RequestParam(value = "error", required = false) String error) {
        model.addAttribute("dip", new Dipendenti());
        model.addAttribute("user", new User());
        if (error != null) {
            model.addAttribute("error", error);
        }
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        return "insertdip";
    }

    @RequestMapping(value = "/addDip", method = POST)
    public String addDip(ModelMap model,
            @Valid @ModelAttribute(value = "dip") Dipendenti dip, BindingResult bindDip,
            @Valid @ModelAttribute(value = "user") User user, BindingResult bindUser
    ) {
        user.setUsername(user.getUsername().toUpperCase());
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        if (bindUser.hasErrors()) {
            model.addAttribute("error", "<br/>" + bindUser.getAllErrors());
            return "redirect:/admin/insertDip";
        }
        serviceUser.addUser(user);
        
        UserRole ur = new UserRole();
        ur.setUser(user);
        ur.setRole("ROLE_USER");
        serviceUserRole.saveOrUpdateUserRole(ur);
        
        dip.setUsername(user);
        serviceDip.saveDipedenti(dip);
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        return "redirect:/admin/home";
    }

    @RequestMapping(value = "/deleteDip", method = GET)
    public String deleteDip(ModelMap model, @RequestParam(value = "matricola") int matricola) {
        serviceDip.deleteDipendenti(matricola);
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        return "redirect:/admin/home";
    }
}
