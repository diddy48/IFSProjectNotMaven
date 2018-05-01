/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.service;

import com.app.model.UserRole;
import java.util.List;

/**
 *
 * @author roman
 */
public interface UserRoleService {

    UserRole findById(int id);

    void saveOrUpdateUserRole(UserRole toSave);

    List<UserRole> findAllUserRole();
}
