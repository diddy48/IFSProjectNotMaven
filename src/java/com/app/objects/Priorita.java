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

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }
    
    
    
   public static Map<String,String> valuesMap(){
       Map<String,String> priorita = new HashMap<>();
       for(Priorita p: Priorita.values()){
           priorita.put(""+p.name(), ""+p.descrizione);
       }
       return priorita;
   }
}
