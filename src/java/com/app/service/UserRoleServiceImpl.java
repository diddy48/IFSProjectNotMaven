/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.service;

import com.app.dao.UserRoleDao;
import com.app.model.UserRole;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author roman
 */
@Transactional
@Service("UserRoleService")
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleDao dao;

    @Override
    public UserRole findById(int id) {
        return dao.findById(id);
    }

    @Override
    public void saveOrUpdateUserRole(UserRole toSave) {
        dao.saveOrUpdateUserRole(toSave);
    }

    @Override
    public List<UserRole> findAllUserRole() {
        return dao.findAll();
    }
}
