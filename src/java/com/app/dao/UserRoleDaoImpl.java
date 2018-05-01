/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.UserRole;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author roman
 */
@Repository
public class UserRoleDaoImpl implements UserRoleDao {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public UserRole findById(int id) {
        return (UserRole) getSession().get(UserRole.class, id);
    }

    @Override
    public void saveOrUpdateUserRole(UserRole toSave) {
        getSession().saveOrUpdate(toSave);
    }

    @Override
    public List<UserRole> findAll() {
        Criteria criteria = getSession().createCriteria(UserRole.class);
        return (List<UserRole>) criteria.list();
    }

}
