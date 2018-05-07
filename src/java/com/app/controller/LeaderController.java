/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.controller;

import com.app.model.Appartenere;
import com.app.model.Dipendenti;
import com.app.model.NC;
import com.app.model.PKAppartenere;
import com.app.model.PKResponsabilita;
import com.app.model.Responsabilita;
import com.app.model.User;
import com.app.model.UserRole;
import com.app.objects.Priorita;
import com.app.objects.RepartoProdotto;
import com.app.objects.Tipo;
import com.app.service.AppartenereService;
import com.app.service.DipendentiService;
import com.app.service.NCService;
import com.app.service.ResponsabilitaService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
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

    @Autowired
    AppartenereService serviceAppartenere;

    @Autowired
    ResponsabilitaService serviceResponsabilita;

    @RequestMapping(value = "/insertNC", method = RequestMethod.GET)
    public String insertNC(ModelMap model,
            @RequestParam(value = "insert", required = false) String added,
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "update", required = false) String update,
            @RequestParam(value = "numeroNC", required = false) Integer numeroNC,
            @RequestParam("submit") String submit) {
        model.addAttribute("submit", submit);
        NC nc = new NC();
        if (added != null) {
            model.addAttribute("insert", added);
        }
        if (error != null) {
            model.addAttribute("error", error);
        }
        if (update != null) {
            model.addAttribute("update", update);
        }
        if (numeroNC != null) {
            NC toUpdate = serviceNc.findById(numeroNC);
            nc.setNumeroNC(toUpdate.getNumeroNC());
            nc.setTitolo(toUpdate.getTitolo());
            nc.setDescrizione(toUpdate.getDescrizione());
            nc.setDataA(toUpdate.getDataA());
            if (toUpdate.getDataC() != null) {
                nc.setDataC(toUpdate.getDataC());
            }
            nc.setPriorita(toUpdate.getPriorita());
            nc.setCodiceProdotto(toUpdate.getCodiceProdotto());
            nc.setCostoNC(toUpdate.getCostoNC());
            nc.setRepartoP(toUpdate.getRepartoP());
            nc.setaContenimento(toUpdate.getaContenimento());
            nc.setCause(toUpdate.getCause());
            nc.setaCorrettiva(toUpdate.getaCorrettiva());
            nc.setaPreventiva(toUpdate.getaPreventiva());
            nc.setIntesaComp(toUpdate.getIntesaComp());
            nc.setTipo(toUpdate.getTipo());
            if (toUpdate.getTipo().compareTo(Tipo.I) == 0) {
                nc.setRichiedente(toUpdate.getRichiedente());
            } else {
                nc.setCliente(toUpdate.getCliente());
            }
            nc.setTeamLeader(toUpdate.getTeamLeader());
            nc.setMembri(toUpdate.getMembri());
            nc.setResponsabili(toUpdate.getResponsabili());
        }
        model.addAttribute("dipendenti", getMatricoleNome());
        model.addAttribute("leader", getLeader());
        model.addAttribute("priorita", Priorita.valuesMap());
        model.addAttribute("reparti", RepartoProdotto.valuesMap());
        model.addAttribute("tipo", Tipo.valuesMap());
        model.addAttribute("nc", nc);
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        return "insertnc";
    }

    @RequestMapping(value = "/addNC", method = RequestMethod.GET)
    public String addNC(@Valid @ModelAttribute("nc") NC nc, BindingResult bindingResult,
            @RequestParam(value = "update", required = false) String update,
            @RequestParam(value = "membri") ArrayList<Integer> matricoleMembri,
            @RequestParam(value = "responsabili") ArrayList<Integer> matricoleResponsabili,
            ModelMap model) {
        /*if (bindingResult.hasErrors()) {
            model.addAttribute("error", "" + bindingResult.getAllErrors());
        } else {*/
        HashSet<Appartenere> membri = (HashSet<Appartenere>) getSetAppartenere(matricoleMembri, nc);
        HashSet<Responsabilita> responsabili = (HashSet<Responsabilita>) getSetResponsabilita(matricoleResponsabili, nc);
        nc.setMembri(membri);
        nc.setResponsabili(responsabili);
        serviceNc.saveOrUpdateNC(nc);

        //return "<br/>"+bindingResult.getAllErrors()+ responsabili.toString();
        if (update != null) {
            model.addAttribute("update", "Hai aggiornato con successo una Non Conformita'");
        } else {
            model.addAttribute("insert", "Hai aggiunto con successo una nuova Non Conformita'");
        }
        // }
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        return "redirect:/";
    }

    @RequestMapping(value = "/deleteNC", method = RequestMethod.POST)
    public String deleteNC(@RequestParam(value = "numeroNC", required = true) Integer numeroNC, ModelMap model) {
        serviceNc.deleteNC(numeroNC);
        model.addAttribute("added", "Hai eliminato con successo una Non Conformita'");
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        return "redirect:/";
    }

    @RequestMapping(value = "/enable", method = GET)
    public String enableNC(
            @RequestParam(value = "numeroNC", required = true) Integer numeroNC,
            @RequestParam(value = "submit", required = true) String submit,
            ModelMap model) {
        NC nc = serviceNc.findById(numeroNC);
        nc.setEnabled(1);
        serviceNc.saveOrUpdateNC(nc);
        model.addAttribute("submit", submit);
        model.addAttribute("numeroNC", numeroNC);
        model.addAttribute("dipLoggato", MainController.dipLoggato);
        return "redirect:/leader/insertNC";
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
           if (isLeader(dips.get(i).getUsername()))
                matrNom.put("" + dips.get(i).getMatricola(), dips.get(i).getMatricola() + " | " + dips.get(i).getNome() + " " + dips.get(i).getCognome());
        }
        return matrNom;
    }


    private Set<Appartenere> getSetAppartenere(ArrayList<Integer> membri, NC nc) {
        Set<Appartenere> membriSet = new HashSet<Appartenere>();
        for (Integer s : membri) {
            Appartenere a = new Appartenere();
            a.setPkAppartenere(new PKAppartenere(serviceDip.findById(s), nc));
            membriSet.add(a);
        }
        return membriSet;
    }

    private HashSet<Responsabilita> getSetResponsabilita(ArrayList<Integer> responsabili, NC nc) {
        HashSet<Responsabilita> responsabiliSet = new HashSet<Responsabilita>();
        for (Integer s : responsabili) {
            Responsabilita a = new Responsabilita();
            a.setPkResponsabilita(new PKResponsabilita(serviceDip.findById(s), nc));
            responsabiliSet.add(a);
        }
        return responsabiliSet;
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
