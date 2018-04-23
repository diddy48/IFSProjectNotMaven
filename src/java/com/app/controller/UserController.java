/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.controller;

import com.app.model.Dipendenti;
import com.app.service.DipendentiService;
import com.app.service.NCService;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author roman
 */
@Controller
@RequestMapping("/user")
@ComponentScan("com.app.service")
public class UserController {
    @Autowired
    DipendentiService serviceDip;
    
    @Autowired
    NCService serviceNc;
    @RequestMapping(value = "/insertNC", method = RequestMethod.GET)   
    public String insertSegnalazione(ModelMap model) {
        List<Dipendenti> dipendenti = serviceDip.findAll();
        model.addAttribute("dipendenti", dipendenti);
        return "insertsegnalazione";
    }
    
    @RequestMapping(value = "/showNC", method = RequestMethod.GET)
    public String listNC(ModelMap model, Principal principal, @RequestParam(value = "matricola", required = false) Integer matricola) {
        Dipendenti dipendente;
        if (matricola == null) {
            dipendente = serviceDip.findByUsername(principal.getName());
            model.addAttribute("dip", dipendente);
        } else {
            dipendente = serviceDip.findById(matricola);
        }
        model.addAttribute("dipendente", dipendente);
        model.addAttribute("ncLeader", dipendente.getNcLeader());
        model.addAttribute("ncRichiede", dipendente.getNcRichiede());
        model.addAttribute("ncResponsabile", serviceNc.findNCResponsabileById(dipendente.getMatricola()));
        model.addAttribute("ncMembro", serviceNc.findNCAppartenereById(dipendente.getMatricola()));
        return "nc";
    }
    
    @RequestMapping(value = "/displayNC", method = GET)
    public String displayNC(ModelMap model, @RequestParam("numeroNC") Integer numeroNC,@RequestParam(value="fase", required=false) String fase) {
        model.addAttribute("nc",serviceNc.findById(numeroNC));
        model.addAttribute("fase",fase);//serviceNc.getFase(numeroNC));
        return "displaync";
    }

}
