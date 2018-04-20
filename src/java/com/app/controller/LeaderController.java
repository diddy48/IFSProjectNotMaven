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
import com.app.objects.Tipo;
import com.app.service.DipendentiService;
import com.app.service.NCService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

    @RequestMapping(value = "/insertNC", method = RequestMethod.GET)
    public String insertNC(ModelMap model, @RequestParam(value = "added", required = false) String added, @RequestParam(value = "error", required = false) String error) {
        if (added != null) {
            model.addAttribute("added", added);
        }
        if (error != null) {
            model.addAttribute("error", error);
        }
        model.addAttribute("dipendenti", getMatricoleNome());
        model.addAttribute("priorita", Priorita.valuesMap());
        model.addAttribute("reparti", RepartoProdotto.valuesMap());
        model.addAttribute("tipo", Tipo.valuesMap());
        NC nc = new NC();
        model.addAttribute("nc", nc);
        return "insertnc";
    }

    @RequestMapping(value = "/addNC", method = RequestMethod.GET)
    public String addNC(@Valid @ModelAttribute("nc") NC nc, BindingResult bindingResult, @RequestParam(value = "richiedente", required = false) Integer matricolaRichiedente, ModelMap model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("error", "" + bindingResult.getAllErrors());
        } else {
            serviceNc.saveNC(nc);
            model.addAttribute("added", "Hai aggiunto con successo una nuova Non Conformita'");
        }
        return "redirect:/leader/insertNC";
    }

    @RequestMapping(value = "/deleteNC", method = RequestMethod.GET)
    public String deleteNC(@RequestParam(value = "numeroNC", required = true) Integer numeroNC, ModelMap model) {
        serviceNc.deleteNC(numeroNC);
        model.addAttribute("added", "Hai eliminato con successo una Non Conformita'");
        return "redirect:/";
    }

    public Map<String, String> getMatricoleNome() {
        List<Dipendenti> dips = serviceDip.findAll();
        Map<String, String> matrNom = new HashMap<>();
        for (Dipendenti dip : dips) {
            matrNom.put("" + dip.getMatricola(), dip.getMatricola() + " | " + dip.getNome() + " " + dip.getCognome());
        }
        return matrNom;
    }
}
