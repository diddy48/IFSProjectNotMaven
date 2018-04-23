/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.service;

import com.app.dao.NCDao;
import com.app.model.NC;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author roman
 */
@Service("NCService")//forse minuscolo dip
@Transactional
public class NCServiceImpl implements NCService {

    @Autowired
    private NCDao dao;

    public NC findById(int id) {
        return dao.findById(id);
    }

    @Override
    public List<NC> findSegnalazioni() {
        return dao.findSegnalazioni();
    }

    @Override
    public void saveOrUpdateNC(NC nc) {
        dao.saveOrUpdateNC(nc);
    }

    @Override
    public void deleteNC(int id) {
        dao.deleteNC(id);
    }

    public List<NC> findNCResponsabileById(int id) {
        return dao.findNCResponsabileById(id);
    }

    @Override
    public List<NC> findNCAppartenereById(int id) {
        return dao.findNCAppartenereById(id);
    }

    @Override
    public List<NC> findNCbyFase(String fase) {
        return dao.findNCbyFase(fase);
    }

    @Override
    public String getFase(int numeroNC) {
        return dao.getFase(numeroNC);
    }

    @Override
    public List<NC> findAll() {
        return dao.findAll();
    }
}
