/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookingbus.dal.impl;

import com.bookingbus.constant.Constant;
import com.bookingbus.dal.DBContext;
import com.bookingbus.entity.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class RoleDAO extends DBContext {

    public List<Role> selectRole() {
        List<Role> roles = new ArrayList<>();
        try {
            Connection connection = getConnection();
            String sql = "SELECT * FROM role";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Role role = new Role();

                // Populate the Role object with data from the ResultSet
                role.setId(resultSet.getInt("id"));
                role.setName(resultSet.getString("name"));

                // Add the Role object to the list
                roles.add(role);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            // Handle any database-related exceptions
            e.printStackTrace();
        }

        return roles;
    }

}

//    @Override
//    public List<Role> findAll() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    public List<Role> selectRole() {
//        String sql = "SELECT *\n"
//                + "FROM role\n";
//        parameterMap = new LinkedHashMap<>();
//        List<Role> listR = queryGenericDAO(Role.class);
//        return listR;
//    }
