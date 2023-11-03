/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookingbus.dal.impl;

import com.bookingbus.constant.Constant;
import com.bookingbus.dal.DBContext;
import com.bookingbus.entity.Bus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class BusDAO extends DBContext {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public List<Bus> findAll() {
        List<Bus> busList = new ArrayList<>();

        try {
            connection = this.getConnection();

            String sql = "SELECT b.* FROM bus b ORDER BY b.id";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Bus bus = new Bus();
                bus.setId(resultSet.getInt("id"));
                bus.setName(resultSet.getString("name"));
                bus.setPrice(resultSet.getInt("price"));
                bus.setPhone(resultSet.getString("phone"));
                bus.setQuantity(resultSet.getInt("quantity"));
                bus.setDescription(resultSet.getString("description"));
                bus.setStatus(resultSet.getString("status"));
                bus.setCreated_on(resultSet.getTimestamp("created_on"));
                bus.setSchedule_id(resultSet.getInt("schedule_id"));

                busList.add(bus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return busList;
    }

    public int findTotalBus() {
        int totalBus = 0;

        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) FROM Bus b WHERE b.status = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "Working");

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                totalBus = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalBus;
    }

    public boolean findBusExistByNameAndSchedulesID(String name, int scheduleid) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Bus b WHERE b.name = ? AND schedule_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, scheduleid);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void insert(Bus bus) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Bus (name, price, phone, quantity, description, status, created_on, schedule_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, bus.getName());
            preparedStatement.setInt(2, bus.getPrice());
            preparedStatement.setString(3, bus.getPhone());
            preparedStatement.setInt(4, bus.getQuantity());
            preparedStatement.setString(5, bus.getDescription());
            preparedStatement.setString(6, bus.getStatus());
            preparedStatement.setTimestamp(7, bus.getCreated_on());
            preparedStatement.setInt(8, bus.getSchedule_id());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean findExistSchedulesID(int scheduleid) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Bus WHERE schedule_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, scheduleid);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void deleteById(int id) {
        try {
            connection = this.getConnection();

            String sql = "DELETE FROM Bus WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editBus(Bus bus, int id) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Bus SET name = ?, price = ?, phone = ?, quantity = ?, description = ?, status = ?, schedule_id = ? WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, bus.getName());
            preparedStatement.setInt(2, bus.getPrice());
            preparedStatement.setString(3, bus.getPhone());
            preparedStatement.setInt(4, bus.getQuantity());
            preparedStatement.setString(5, bus.getDescription());
            preparedStatement.setString(6, bus.getStatus());
            preparedStatement.setInt(7, bus.getSchedule_id());
            preparedStatement.setInt(8, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean findExistSchedulesIdByBus(int scheduleid, int id) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Bus WHERE schedule_id = ? AND id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, scheduleid);
            preparedStatement.setInt(2, id);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int countAllBus() {
        int count = 0;
        try {
            connection = this.getConnection();
            
            String sql = "SELECT COUNT(*) FROM Bus";
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
//    public List<Bus> findAll() {
//        String sql = "SELECT b.* FROM bus b ORDER BY b.id\n";
//        parameterMap = new LinkedHashMap<>();
//        return queryGenericDAO(Bus.class, sql, parameterMap);
//    }
//
//    public int findTotalBus() {
//        String sql = "SELECT COUNT(*)\n"
//                + "FROM Bus b\n"
//                + "WHERE b.status = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("status", "Working");
//        return findTotalRecordGenericDAO(Bus.class, sql, parameterMap);
//    }
//
//    public boolean findBusExistByNameAndSchedulesID(String name, int scheduleid) {
//        String sql = "SELECT * FROM Bus b\n"
//                + "WHERE b.name = ? AND schedule_id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("name", name);
//        parameterMap.put("schedule_id", scheduleid);
//        List<Bus> list = queryGenericDAO(Bus.class, sql, parameterMap);
//        return !list.isEmpty();
//    }
//
//    public void insert(Bus bus) {
//        insertGenericDAO(bus);
//    }
//
//    public boolean findExistSchedulesID(int scheduleid) {
//        String sql = "SELECT * FROM Bus b\n"
//                + "WHERE schedule_id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("schedule_id", scheduleid);
//        List<Bus> list = queryGenericDAO(Bus.class, sql, parameterMap);
//        return !list.isEmpty();
//    }
//
//    public void deleteById(int id) {
//        String sql = "DELETE FROM [dbo].[Bus]\n"
//                + "      WHERE id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("id", id);
//        updateGenericDAO(sql, parameterMap);
//    }
//
//
//    public void editBus(Bus bus, int id) {
//        String sql = "UPDATE [dbo].[Bus]\n"
//                + "   SET [name] = ?\n"
//                + "      ,[price] = ?\n"
//                + "      ,[phone] = ?\n"
//                + "      ,[quantity] = ?\n"
//                + "      ,[description] = ?\n"
//                + "      ,[status] = ?\n"
//                + "      ,[schedule_id] = ?\n"
//                + " WHERE id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("name", bus.getName());
//        parameterMap.put("price", bus.getPrice());
//        parameterMap.put("phone", bus.getPhone());
//        parameterMap.put("quantity", bus.getQuantity());
//        parameterMap.put("description", bus.getDescription());
//        parameterMap.put("status", bus.getStatus());
//        parameterMap.put("schedule_id", bus.getSchedule_id());
//        parameterMap.put("id", id);
//        updateGenericDAO(sql, parameterMap);
//    }
//
//    public boolean findExistSchedulesIdByBus(int scheduleid, int id) {
//        String sql = "SELECT * FROM Bus b\n"
//                + "WHERE schedule_id = ? AND id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("schedule_id", scheduleid);
//        parameterMap.put("id", id);
//        List<Bus> list = queryGenericDAO(Bus.class, sql, parameterMap);
//        return !list.isEmpty();
//    }
