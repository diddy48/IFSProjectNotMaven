/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.service;

import com.app.model.NC;
import java.util.List;

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
}
