/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.Responsabilita;
import java.util.List;

/**
 *
 * @author roman
 */
public interface ResponsabilitaDao {

    Responsabilita findById(int id);

    void saveOrUpdateResponsabilita(Responsabilita resp);

    void deleteResponsabilita(int id);

    List<Responsabilita> findAll();
}
