/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.controller;

import com.app.model.NC;
import com.app.service.DipendentiService;
import com.app.service.NCService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author roman
 */
@Controller
@RequestMapping("/leader")
@ComponentScan("com.app.service")
public class LeaderController {

    @Autowired
    DipendentiService serviceDip;

    @Autowired
    NCService serviceNc;
    
    @RequestMapping(value="/insertNC", method = RequestMethod.GET)
    public String insertNC(ModelMap model,@RequestParam(value = "added", required = false) String added){
        if(added !=null){
            model.addAttribute("addedMsg","Hai aggiunto con successo una nuova Non Conformità");
        }
        NC nc = new NC();
        model.addAttribute("nc",nc);
        return "insertnc";
    }
    
     @RequestMapping(value="/addNC", method = RequestMethod.GET)
    public String addNC(@ModelAttribute("nc") NC nc,ModelMap model){
        serviceNc.saveNC(nc);
        return "insertnc?added";
    }
}
