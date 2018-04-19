/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.controller;

import com.app.model.Dipendenti;
import com.app.model.NC;
import com.app.objects.Priorita;
import com.app.objects.RepartoProdotto;
import com.app.service.DipendentiService;
import com.app.service.NCService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

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
        model.addAttribute("dipendenti",getMatricoleNome());
        model.addAttribute("priorita",Priorita.valuesMap());
        model.addAttribute("reparti",RepartoProdotto.valuesMap());
        model.addAttribute("nc",new NC());
        return "insertnc";
    }
    
     @RequestMapping(value="/addNC", method = RequestMethod.GET,consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public String addNC(@ModelAttribute("nc") NC nc,ModelMap model){
        serviceNc.saveNC(nc);
        return "insertnc?added";
    }
    
    public Map<String,String> getMatricoleNome(){
        List<Dipendenti> dips = serviceDip.findAll();
        Map<String,String> matrNom = new HashMap<>();
        for(Dipendenti dip: dips){
            matrNom.put(""+dip.getMatricola(), dip.getMatricola()+"    "+dip.getNome()+" "+dip.getCognome());
        }
        return matrNom;
    }
}
