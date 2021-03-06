/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

//import biblio.model.Utenti;
import com.app.model.Dipendenti;
import com.app.model.NC;
import java.util.List;
import java.util.Objects;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("DipendentiDao")
public class DipendentiDaoImpl implements DipendentiDao {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public Dipendenti findById(int id) {
        return (Dipendenti) getSession().get(Dipendenti.class, id);
    }

    @Override
    public Dipendenti findByUsername(String username) {
        return (Dipendenti) getSession().createCriteria(Dipendenti.class).add(Restrictions.eq("username.username", username)).uniqueResult();
    }

    @Override
    public void saveDipendenti(Dipendenti dip) {
        getSession().persist(dip);
    }

    @Override
    public void deleteDipendenti(int id) {
        Dipendenti d = (Dipendenti) getSession().load(Dipendenti.class, id);
        if (d != null) {
            getSession().delete(d);
        }
    }

    @Override
    public List<Dipendenti> findAll() {
        Criteria criteria = getSession().createCriteria(Dipendenti.class).addOrder(Order.asc("matricola")).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        return (List<Dipendenti>) criteria.list();
    }

    @Override
    public Dipendenti findDipendenti(String mail, String password) {
        Criteria criteria = getSession().createCriteria(Dipendenti.class).add(Restrictions.eq("mail", mail)).add(Restrictions.eq("password", password));
        if (criteria.list().isEmpty()) {
            return null;
        }
        return (Dipendenti) criteria.uniqueResult();
    }

    @Override
    public boolean isLeader(Integer matricola,Integer numeroNC) {
        NC nc = (NC) getSession().createCriteria(NC.class).add(Restrictions.eq("numeroNC", numeroNC)).list().get(0);
        return Objects.equals(nc.getTeamLeader().getMatricola(), matricola);
    }

}
