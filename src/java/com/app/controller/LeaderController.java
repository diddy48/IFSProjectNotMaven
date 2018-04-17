/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.controller;

import com.app.service.DipendentiService;
import com.app.service.NCService;
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
@RequestMapping("/leader")
@ComponentScan("com.app.service")
public class LeaderController {

    @Autowired
    DipendentiService serviceDip;

    @Autowired
    NCService serviceNc;
    
    @RequestMapping(value="/insertNC", method = RequestMethod.GET)
    public String insertNC(ModelMap model){
        
        return "insertnc";
    }
}
