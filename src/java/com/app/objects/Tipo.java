package com.app.objects;

import java.util.HashMap;
import java.util.Map;

public enum Tipo{

I("Interna"),
R("Reclamo");

private String descrizione;

    private Tipo(String descizione) {
        this.descrizione = descizione;
    }
    
    public static Map<String,String> valuesMap(){
       Map<String,String> tipi = new HashMap<>();
       for(Tipo p: Tipo.values()){
           tipi.put(""+p.name(), ""+p.descrizione);
       }
       return tipi;
   }

}
