/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.Appartenere;
import java.util.List;

/**
 *
 * @author roman
 */
public interface AppartenereDao {

    Appartenere findById(int id);

    void saveOrUpdateAppartenere(Appartenere app);

    void deleteAppartenere(int id);

    List<Appartenere> findAll();
}
