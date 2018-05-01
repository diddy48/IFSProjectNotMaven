/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.service;

import com.app.dao.AppartenereDao;
import com.app.model.Appartenere;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author roman
 */
@Service("AppartenereService")//forse minuscolo dip
@Transactional
public class AppartenereServiceImpl implements AppartenereService {

    @Autowired
    private AppartenereDao dao;

    @Override
    public Appartenere findById(int id) {
        return dao.findById(id);
    }

    @Override
    public void saveOrUpdateAppartenere(Appartenere app) {
        dao.saveOrUpdateAppartenere(app);
    }

    @Override
    public void deleteAppartenere(int id) {
        dao.deleteAppartenere(id);
    }

    @Override
    public List<Appartenere> findAll() {
        return dao.findAll();
    }

}
