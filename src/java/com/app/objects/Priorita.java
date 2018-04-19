package com.app.objects;

import java.util.HashMap;
import java.util.Map;

public enum Priorita {

    B("Bassa"),
    M("Media"),
    A("Alta");

    private String descrizione;

    private Priorita(String descizione) {
        this.descrizione = descizione;
    }
    
   public static Map<String,String> valuesMap(){
       Map<String,String> priorita = new HashMap<>();
       for(Priorita p: Priorita.values()){
           priorita.put(""+p.name(), ""+p.descrizione);
       }
       return priorita;
   }
}
