/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.controller;

import com.app.model.Dipendenti;
import com.app.model.NC;
import com.app.model.Responsabilita;
import com.app.model.User;
import com.app.model.UserRole;
import com.app.objects.Priorita;
import com.app.objects.RepartoProdotto;
import com.app.objects.Tipo;
import com.app.service.DipendentiService;
import com.app.service.NCService;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
        model.addAttribute("dipendenti", getMatricoleNome());
        model.addAttribute("leader", getLeader());
        model.addAttribute("priorita", Priorita.valuesMap());
        model.addAttribute("reparti", RepartoProdotto.valuesMap());
        model.addAttribute("tipo", Tipo.valuesMap());
        model.addAttribute("nc", new NC());
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        return "insertsegnalazione";
    }

    @RequestMapping(value = "/addNC", method = RequestMethod.GET)
    public String addNC(@Valid @ModelAttribute("nc") NC nc, BindingResult bindingResult,
            @RequestParam(value = "insert", required = true) String insert,
            ModelMap model) {
        if (insert != null) {
            if (bindingResult.hasErrors()) {
                model.addAttribute("error", "" + bindingResult.getAllErrors());
            } else {
                serviceNc.saveOrUpdateNC(nc);
                model.addAttribute("insert", "Hai aggiunto con successo una nuova segnalazione'");
            }
        }
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        return "redirect:/";
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
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        return "nc";
    }

    @RequestMapping(value = "/displayNC", method = GET)
    public String displayNC(ModelMap model, @RequestParam("numeroNC") Integer numeroNC, @RequestParam(value = "fase", required = false) String fase) {
        NC nc = serviceNc.findById(numeroNC);
        model.addAttribute("nc", nc);
        model.addAttribute("fase", fase);//serviceNc.getFase(numeroNC));
        if (nc.getRichiedente() != null) {
            Dipendenti richiedente = serviceDip.findById(nc.getRichiedente().getMatricola());
            model.addAttribute("richiedente", richiedente.getNome() + " " + richiedente.getCognome());
        }
        model.addAttribute("responsabili",serviceNc.getResponsabili(nc));
        model.addAttribute("membri",serviceNc.getMembri(nc));
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        return "displaync";
    }

    @RequestMapping(value = "/statistiche", method = GET)
    public String statistiche(ModelMap model) {
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        model.addAttribute("calcNCFase", serviceNc.getCountByFase());
        model.addAttribute("calcNCReparto", serviceNc.getCountByReparto());
        model.addAttribute("calcNCMese", serviceNc.getCountByMese());
        return "statistiche";
    }

    public Map<String, String> getMatricoleNome() {
        List<Dipendenti> dips = serviceDip.findAll();
        Map<String, String> matrNom = new HashMap<>();
        for (int i = 1; i < dips.size(); i++) {
            matrNom.put("" + dips.get(i).getMatricola(), dips.get(i).getMatricola() + " | " + dips.get(i).getNome() + " " + dips.get(i).getCognome());
        }
        return matrNom;
    }

    public Map<String, String> getLeader() {
        List<Dipendenti> dips = serviceDip.findAll();
        Map<String, String> matrNom = new HashMap<>();
        for (int i = 1; i < dips.size(); i++) {
            if (isLeader(dips.get(i).getUsername())) {
                matrNom.put("" + dips.get(i).getMatricola(), dips.get(i).getMatricola() + " | " + dips.get(i).getNome() + " " + dips.get(i).getCognome());
            }
        }
        return matrNom;
    }

    public boolean isLeader(User user) {
        for (UserRole ur : user.getUserRole()) {
            if (ur.getRole().equals("ROLE_LEADER")) {
                return true;
            }
        }
        return false;
    }
}
