/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookingbus.dal.impl;

import com.bookingbus.dal.DBContext;
import com.bookingbus.entity.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class ContactDAO extends DBContext {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public void insertContact(Contact contact) {
        try {
            connection = getConnection();

            String insertQuery = "INSERT INTO Contact (name, email, subject, message, account_id, created_on) VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, contact.getName());
            preparedStatement.setString(2, contact.getEmail());
            preparedStatement.setString(3, contact.getSubject());
            preparedStatement.setString(4, contact.getMessage());
            if (contact.getAccount_id() == 0) {
                preparedStatement.setNull(5, Types.INTEGER);
            } else {
                preparedStatement.setInt(5, contact.getAccount_id());
            }
            preparedStatement.setTimestamp(6, contact.getCreated_on());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

   public List<Contact> findAll() {
    List<Contact> contacts = new ArrayList<>();
    
    try {
        connection = this.getConnection(); 
        String sql = "SELECT * FROM Contact";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            Contact contact = new Contact();
            contact.setId(resultSet.getInt("id"));
            contact.setName(resultSet.getString("name"));
            contact.setEmail(resultSet.getString("email"));
            contact.setSubject(resultSet.getString("subject"));
            contact.setMessage(resultSet.getString("message"));
            contact.setAccount_id(resultSet.getInt("account_id"));
            contact.setCreated_on(resultSet.getTimestamp("created_on"));
            
            contacts.add(contact);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } 
    return contacts;
}

    public void deleteById(int id) {
        try {
            connection = this.getConnection();

            String sql = "DELETE FROM Contact WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
