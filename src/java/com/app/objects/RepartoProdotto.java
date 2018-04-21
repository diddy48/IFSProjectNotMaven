package com.app.objects;

import java.util.HashMap;
import java.util.Map;

public enum RepartoProdotto {

    Progettazione("Progettazione"),
    Produzione("Produzione"),
    LogisticaE("Logistica in Uscita"),
    LogisticaU("Logistica in Uscita"),
    Commerciale("Commerciale"),
    Amministrativo("Amministrativo");

    private String descrizione;

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    private RepartoProdotto(String descizione) {
        this.descrizione = descizione;
    }
    
    public static Map<String,String> valuesMap(){
       Map<String,String> reparti = new HashMap<>();
       for(RepartoProdotto p: RepartoProdotto.values()){
           reparti.put(""+p.name(), ""+p.descrizione);
       }
       return reparti;
   }

}
