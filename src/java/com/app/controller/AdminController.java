/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.controller;

import com.app.model.Dipendenti;
import com.app.service.DipendentiService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    
    @RequestMapping(value = "/home", method = RequestMethod.GET)   
    public String adminPage(ModelMap model) {
        List<Dipendenti> dipendenti = serviceDip.findAll();
        model.addAttribute("dipendenti", dipendenti);
        return "adminHome";
    }
}
