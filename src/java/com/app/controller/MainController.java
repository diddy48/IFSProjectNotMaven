package com.app.controller;

import com.app.model.Dipendenti;
import com.app.model.NC;
import com.app.service.DipendentiService;
import com.app.service.NCService;
import com.app.service.UserService;
import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@ComponentScan("com.app.service")
public class MainController {

    @Autowired
    DipendentiService serviceDip;

    @Autowired
    NCService serviceNc;
    
    public static Dipendenti dipLoggato;

    @RequestMapping(value = {"/", "/welcome**"}, method = RequestMethod.GET)
    public String defaultPage(ModelMap model, Principal principal) {
        if (principal != null) {
            Dipendenti dipendente = serviceDip.findByUsername(principal.getName());
            dipLoggato=dipendente;
            model.addAttribute("dipLoggato",dipendente);
        }
        model.addAttribute("ncAperte", serviceNc.findNCbyFase("A"));
        model.addAttribute("ncIntermedie", serviceNc.findNCbyFase("I"));
        model.addAttribute("ncChiuse", serviceNc.findNCbyFase("C"));
        model.addAttribute("segnalazioni", serviceNc.findSegnalazioni());
        
        model.addAttribute("calcNCFase",serviceNc.getCountByFase());
        model.addAttribute("calcNCReparto",serviceNc.getCountByReparto());
        model.addAttribute("calcNCMese",serviceNc.getCountByMese());
        return "home";
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login(Principal principal,@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout, HttpServletRequest request, ModelMap model) {
        if(principal!=null) return "redirect:/";
        if (error != null) {
            model.addAttribute("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
        }
        if (logout != null) {
            model.addAttribute("msg", "Sei uscito con successo dal tuo account");
        }
        return "login";
    }

    // customize the error message
    private String getErrorMessage(HttpServletRequest request, String key) {

        Exception exception = (Exception) request.getSession().getAttribute(key);

        String error = "";
        if (exception instanceof BadCredentialsException) {
            error = "Password e nome utente non validi!";
        } else if (exception instanceof LockedException) {
            error = exception.getMessage();
        } else {
            error = "Non sei autorizzato ad entrare!";
        }

        return error;
    }

    // for 403 access denied page
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(ModelMap model) {
        // check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            System.out.println(userDetail);
            model.addAttribute("username", userDetail.getUsername());
        }
        return "403";
    }

}
