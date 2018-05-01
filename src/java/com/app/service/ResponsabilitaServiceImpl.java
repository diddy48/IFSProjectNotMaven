/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.service;

import com.app.dao.ResponsabilitaDao;
import com.app.model.Responsabilita;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author roman
 */
@Service("ResponsabilitaService")//forse minuscolo dip
@Transactional
public class ResponsabilitaServiceImpl implements ResponsabilitaService {

    @Autowired
    private ResponsabilitaDao dao;

    @Override
    public Responsabilita findById(int id) {
        return dao.findById(id);
    }

    @Override
    public void saveOrUpdateResponsabilita(Responsabilita resp) {
        dao.saveOrUpdateResponsabilita(resp);
    }

    @Override
    public void deleteResponsabilita(int id) {
        dao.deleteResponsabilita(id);
    }

    @Override
    public List<Responsabilita> findAll() {
        return dao.findAll();
    }

}
