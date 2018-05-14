/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.service;

import com.app.model.NC;
import com.app.model.Responsabilita;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 *
 * @author roman
 */
public interface NCService {
    NC findById(int id);
    List<NC> findSegnalazioni();
    void saveOrUpdateNC(NC nc);
    void deleteNC(int id);
    List<NC> findNCbyFase(String fase);
    List<NC> findNCResponsabileById(int id);
    List<NC> findNCAppartenereById(int id);
    String getFase(int numeroNC);
    List<NC> findAll(); 
    /**
     * Filtra le tue NC
     * @param nc lista delle nc
     * @param filter Responsabile, Leader, Richiedente, Membro
     * @return lista delle nc filtrate
     */
    List<NC> filterNC(List<NC> nc,String filter, int MatricolaDip);

    public int[] getCountByReparto();

    public int[] getCountByFase();

    public int[] getCountByMese();

    public ArrayList<String> getResponsabili(NC nc);

    public ArrayList<String> getMembri(NC nc);
}
