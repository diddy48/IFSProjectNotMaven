/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.NC;
import java.util.List;

/**
 *
 * @author roman
 */
public interface NCDao {
    NC findById(int id);
    List<NC> findSegnalazioni();
    void saveOrUpdateNC(NC dip);
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
    List<NC> filterNC(List<NC> nc,String filter);
}

