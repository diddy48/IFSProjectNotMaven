/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.service;

import com.app.model.Responsabilita;
import java.util.List;

/**
 *
 * @author roman
 */
public interface ResponsabilitaService {
    
    Responsabilita findById(int id);

    void saveOrUpdateResponsabilita(Responsabilita resp);

    void deleteResponsabilita(int id);

    List<Responsabilita> findAll();
}
