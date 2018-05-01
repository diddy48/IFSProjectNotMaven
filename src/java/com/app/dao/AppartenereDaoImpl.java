/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.Appartenere;
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
@Repository("AppartenereDao")
public class AppartenereDaoImpl implements AppartenereDao {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public Appartenere findById(int id) {
        return (Appartenere) getSession().get(Appartenere.class, id);
    }

    @Override
    public void saveOrUpdateAppartenere(Appartenere app) {
        getSession().saveOrUpdate(app);
    }

    @Override
    public void deleteAppartenere(int id) {
        Appartenere a = (Appartenere) getSession().load(Appartenere.class, id);
        if (a != null) {
            getSession().delete(a);
        }
    }

    @Override
    public List<Appartenere> findAll() {
        Criteria criteria = getSession().createCriteria(Appartenere.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        return (List<Appartenere>) criteria.list();
    }

}
