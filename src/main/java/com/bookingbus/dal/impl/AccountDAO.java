/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookingbus.dal.impl;

import com.bookingbus.constant.Constant;
import com.bookingbus.dal.DBContext;
import com.bookingbus.entity.Account;
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
public class AccountDAO extends DBContext {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public Account findAccountByNamePass(Account account) {

        try {
            connection = this.getConnection();

            String sql = "SELECT a.*, r.name "
                    + "FROM Account a "
                    + "JOIN Role r ON a.roleId = r.id "
                    + "WHERE a.username = ? AND a.password = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getUsername());
            preparedStatement.setString(2, account.getPassword());

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Account foundAccount = new Account();
                foundAccount.setId(resultSet.getInt("id"));
                foundAccount.setUsername(resultSet.getString("username"));
                foundAccount.setPassword(resultSet.getString("password"));
                foundAccount.setFirstname(resultSet.getString("firstname"));
                foundAccount.setLastname(resultSet.getString("lastname"));
                foundAccount.setEmail(resultSet.getString("email"));
                foundAccount.setPhone(resultSet.getString("phone"));
                foundAccount.setAddress(resultSet.getString("address"));
                foundAccount.setImage(resultSet.getString("image"));
                foundAccount.setCreated_on(resultSet.getTimestamp("created_on"));
                foundAccount.setRoleId(resultSet.getInt("roleId"));
                foundAccount.setName(resultSet.getString("name"));

                return foundAccount;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean findByUsernameAndEmail(String username, String email) {
        try {
            connection = this.getConnection();

            String sql = "SELECT a.*, r.name "
                    + "FROM Account a "
                    + "JOIN Role r ON a.roleId = r.id "
                    + "WHERE a.username = ? OR a.email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int insert(Account account) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = this.getConnection();

            String sql = "INSERT INTO Account (username, password, firstname, lastname, email, phone, address, image, roleId, created_on) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getUsername());
            preparedStatement.setString(2, account.getPassword());
            preparedStatement.setString(3, account.getFirstname());
            preparedStatement.setString(4, account.getLastname());
            preparedStatement.setString(5, account.getEmail());
            preparedStatement.setString(6, account.getPhone());
            preparedStatement.setString(7, account.getAddress());
            preparedStatement.setString(8, account.getImage());
            preparedStatement.setInt(9, account.getRoleId());
            preparedStatement.setTimestamp(10, account.getCreated_on());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public void updateProfile(Account account) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Account "
                    + "SET firstname = ?, lastname = ?, phone = ?, address = ?, image = ? "
                    + "WHERE username = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getFirstname());
            preparedStatement.setString(2, account.getLastname());
            preparedStatement.setString(3, account.getPhone());
            preparedStatement.setString(4, account.getAddress());
            preparedStatement.setString(5, account.getImage());
            preparedStatement.setString(6, account.getUsername());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePassword(String newPassword, String username) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Account SET password = ? WHERE username = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, username);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Account> findUsers() {
        List<Account> userList = new ArrayList<>();

        try {
            connection = this.getConnection();

            String sql = "SELECT a.*, r.name "
                    + "FROM Account a "
                    + "JOIN Role r ON a.roleId = r.id "
                    + "WHERE a.roleId = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, Constant.ROLE_USER);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Account account = new Account();
                account.setId(resultSet.getInt("id"));
                account.setUsername(resultSet.getString("username"));
                account.setPassword(resultSet.getString("password"));
                account.setFirstname(resultSet.getString("firstname"));
                account.setLastname(resultSet.getString("lastname"));
                account.setEmail(resultSet.getString("email"));
                account.setPhone(resultSet.getString("phone"));
                account.setAddress(resultSet.getString("address"));
                account.setImage(resultSet.getString("image"));
                account.setCreated_on(resultSet.getTimestamp("created_on"));
                account.setRoleId(resultSet.getInt("roleId"));
                account.setName(resultSet.getString("name"));
                userList.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public void deleteById(int id) {
        try {
            connection = this.getConnection();

            String sql = "DELETE FROM Account WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editAccount(Account account, String oldUsername) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Account "
                    + "SET username = ?, "
                    + "firstname = ?, "
                    + "lastname = ?, "
                    + "email = ?, "
                    + "phone = ?, "
                    + "address = ?, "
                    + "roleId = ?, "
                    + "image = ? "
                    + "WHERE username = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getUsername());
            preparedStatement.setString(2, account.getFirstname());
            preparedStatement.setString(3, account.getLastname());
            preparedStatement.setString(4, account.getEmail());
            preparedStatement.setString(5, account.getPhone());
            preparedStatement.setString(6, account.getAddress());
            preparedStatement.setInt(7, account.getRoleId());
            preparedStatement.setString(8, account.getImage());
            preparedStatement.setString(9, oldUsername);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Account> findAdmin() {
        List<Account> adminList = new ArrayList<>();

        try {
            connection = this.getConnection();

            String sql = "SELECT a.*, r.name "
                    + "FROM Account a "
                    + "JOIN Role r ON a.roleId = r.id "
                    + "WHERE a.roleId = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, Constant.ROLE_ADMIN);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Account adminAccount = new Account();
                adminAccount.setId(resultSet.getInt("id"));
                adminAccount.setUsername(resultSet.getString("username"));
                adminAccount.setPassword(resultSet.getString("password"));
                adminAccount.setFirstname(resultSet.getString("firstname"));
                adminAccount.setLastname(resultSet.getString("lastname"));
                adminAccount.setEmail(resultSet.getString("email"));
                adminAccount.setPhone(resultSet.getString("phone"));
                adminAccount.setAddress(resultSet.getString("address"));
                adminAccount.setImage(resultSet.getString("image"));
                adminAccount.setCreated_on(resultSet.getTimestamp("created_on"));
                adminAccount.setRoleId(resultSet.getInt("roleId"));
                adminAccount.setName(resultSet.getString("name"));
                adminList.add(adminAccount);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adminList;
    }

    public boolean findAccByOldUsernameAndEmail(String oldUsername, String email) {
        try {
            connection = this.getConnection();

            String sql = "SELECT a.*, r.name "
                    + "FROM Account a "
                    + "JOIN Role r ON a.roleId = r.id "
                    + "WHERE a.username = ? AND a.email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, oldUsername);
            preparedStatement.setString(2, email);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int countAllAccount() {
        int count = 0;
        try {
            connection = this.getConnection();
            
            String sql = "SELECT COUNT(*) FROM Account";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
            return count;
        } catch (SQLException e) {
            e.printStackTrace(); 
            return 0;
        }
    }

}
//    @Override
//    public List<Account> findAll() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    public Account findAccountByNamePass(Account account) {
//        String sql = "SELECT a.*, r.name\n"
//                + "FROM Account a\n"
//                + "JOIN Role r ON a.roleId = r.id\n"
//                + "WHERE a.username = ? and a.password = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("username", account.getUsername());
//        parameterMap.put("password", account.getPassword());
//        List<Account> list = queryGenericDAO(Account.class, sql, parameterMap);
//        if (list.isEmpty()) {
//            return null;
//        } else {
//            return list.get(0);
//        }
//    }
//
//    public boolean findByUsernameAndEmail(String username, String email) {
//        String sql = "SELECT a.*, r.name\n"
//                + "FROM Account a\n"
//                + "JOIN Role r ON a.roleId = r.id\n"
//                + "WHERE a.username = ? AND a.email = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("username", username);
//        parameterMap.put("email", email);
//        List<Account> list = queryGenericDAO(Account.class, sql, parameterMap);
//        return !list.isEmpty();
//    }
//
//    public int insert(Account t) {
//        return insertGenericDAO(t);
//    }
//
//    public void updateProfile(Account account) {
//        String sql = "UPDATE [dbo].[Account]\n"
//                + "   SET [firstname] = ?\n"
//                + "      ,[lastname] = ?\n"
//                + "      ,[phone] = ?\n"
//                + "      ,[address] = ?\n"
//                + "      ,[image] = ?\n"
//                + " WHERE username = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("firstname", account.getFirstname());
//        parameterMap.put("lastname", account.getLastname());
//        parameterMap.put("phone", account.getPhone());
//        parameterMap.put("address", account.getAddress());
//        parameterMap.put("image", account.getImage());
//        parameterMap.put("username", account.getUsername());
//        updateGenericDAO(sql, parameterMap);
//    }
//
//    public void updatePassword(String newPassword, String username) {
//        String sql = "UPDATE [dbo].[Account]\n"
//                + "   SET [password] = ?\n"
//                + " WHERE username = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("password", newPassword);
//        parameterMap.put("username", username);
//        updateGenericDAO(sql, parameterMap);
//    }
//
//    public List<Account> findUsers() {
//        String sql = "SELECT a.*, r.name\n"
//                + "FROM Account a\n"
//                + "JOIN Role r ON a.roleId = r.id\n"
//                + "WHERE a.roleId = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("roleId", Constant.ROLE_USER);
//        List<Account> listU = queryGenericDAO(Account.class, sql, parameterMap);
//        return listU;
//    }
//
//    public void deleteById(int id) {
//        String sql = "DELETE FROM [dbo].[Account]\n"
//                + "      WHERE id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("id", id);
//        updateGenericDAO(sql, parameterMap);
//    }
//
//    public void editAccount(Account account, String oldUsername) {
//        String sql = "UPDATE [dbo].[Account]\n"
//                + "   SET [username] = ?\n"
//                + "      ,[firstname] = ?\n"
//                + "      ,[lastname] = ?\n"
//                + "      ,[email] = ?\n"
//                + "      ,[phone] = ?\n"
//                + "      ,[address] = ?\n"
//                + "      ,[roleId] = ?\n"
//                + "      ,[image] = ?\n"
//                + " WHERE username = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("newusername", account.getUsername());
//        parameterMap.put("firstname", account.getFirstname());
//        parameterMap.put("lastname", account.getLastname());
//        parameterMap.put("email", account.getEmail());
//        parameterMap.put("phone", account.getPhone());
//        parameterMap.put("address", account.getAddress());
//        parameterMap.put("roleId", account.getRoleId());
//        parameterMap.put("image", account.getImage());
//        parameterMap.put("oldusername", oldUsername);
//        updateGenericDAO(sql, parameterMap);
//    }
//
//    public List<Account> findAdmin() {
//        String sql = "SELECT a.*, r.name\n"
//                + "FROM Account a\n"
//                + "JOIN Role r ON a.roleId = r.id\n"
//                + "WHERE a.roleId = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("roleId", Constant.ROLE_ADMIN);
//        List<Account> listA = queryGenericDAO(Account.class, sql, parameterMap);
//        return listA;
//    }
