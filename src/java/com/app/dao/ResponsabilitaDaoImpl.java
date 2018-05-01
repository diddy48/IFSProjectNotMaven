/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.Responsabilita;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author roman
 */
@Transactional
@Repository("ResponsabilitaDao")
public class ResponsabilitaDaoImpl implements ResponsabilitaDao {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public Responsabilita findById(int id) {
        return (Responsabilita) getSession().get(Responsabilita.class, id);
    }

    @Override
    public void saveOrUpdateResponsabilita(Responsabilita resp) {
        getSession().saveOrUpdate(resp);
    }

    @Override
    public void deleteResponsabilita(int id) {
        Responsabilita r = (Responsabilita) getSession().load(Responsabilita.class, id);
        if (r != null) {
            getSession().delete(r);
        }
    }

    @Override
    public List<Responsabilita> findAll() {
        Criteria criteria = getSession().createCriteria(Responsabilita.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        return (List<Responsabilita>) criteria.list();
    }

}
