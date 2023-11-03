/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookingbus.dal.impl;

import com.bookingbus.constant.Constant;
import com.bookingbus.dal.DBContext;
import com.bookingbus.entity.Bus;
import com.bookingbus.entity.Businfo;
import java.io.Serializable;
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
public class BusinfoDAO extends DBContext {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public List<Businfo> findByPage(int page) throws SQLException {
        List<Businfo> busInfoList = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT b.*, s.departure_location, s.arrival_location, s.take_time, s.pickup_time "
                    + "FROM bus b "
                    + "JOIN schedules s ON b.schedule_id = s.id "
                    + "WHERE b.status = ? "
                    + "ORDER BY b.id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "Working");
            preparedStatement.setInt(2, (page - 1) * Constant.RECORD_PER_PAGE);
            preparedStatement.setInt(3, Constant.RECORD_PER_PAGE);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Businfo businfo = new Businfo();
                businfo.setId(resultSet.getInt("id"));
                businfo.setName(resultSet.getString("name"));
                businfo.setPrice(resultSet.getInt("price"));
                businfo.setPhone(resultSet.getString("phone"));
                businfo.setQuantity(resultSet.getInt("quantity"));
                businfo.setDescription(resultSet.getString("description"));
                businfo.setStatus(resultSet.getString("status"));
                businfo.setCreated_on(resultSet.getTimestamp("created_on"));
                businfo.setSchedule_id(resultSet.getInt("schedule_id"));
                businfo.setDeparture_location(resultSet.getString("departure_location"));
                businfo.setArrival_location(resultSet.getString("arrival_location"));
                businfo.setTake_time(resultSet.getTimestamp("take_time"));
                businfo.setPickup_time(resultSet.getTimestamp("pickup_time"));

                busInfoList.add(businfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return busInfoList;
    }

    public List<Businfo> findBySeatPageAndTime(int seat, Timestamp takeTime, Timestamp pickupTime, int page) throws SQLException {
        List<Businfo> busInfoList = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT b.*, s.departure_location, s.arrival_location, s.take_time, s.pickup_time "
                    + "FROM Bus b "
                    + "JOIN Schedules s ON b.schedule_id = s.id "
                    + "WHERE b.quantity = ? AND b.status = ? AND s.take_time >= ? AND s.pickup_time <= ? "
                    + "ORDER BY b.id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, seat);
            preparedStatement.setString(2, "Working");
            preparedStatement.setTimestamp(3, takeTime);
            preparedStatement.setTimestamp(4, pickupTime);
            preparedStatement.setInt(5, (page - 1) * Constant.RECORD_PER_PAGE);
            preparedStatement.setInt(6, Constant.RECORD_PER_PAGE);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Businfo businfo = new Businfo();
                // Populate the Businfo object with data from the ResultSet
                businfo.setId(resultSet.getInt("id"));
                businfo.setName(resultSet.getString("name"));
                businfo.setPrice(resultSet.getInt("price"));
                businfo.setPhone(resultSet.getString("phone"));
                businfo.setQuantity(resultSet.getInt("quantity"));
                businfo.setDescription(resultSet.getString("description"));
                businfo.setStatus(resultSet.getString("status"));
                businfo.setCreated_on(resultSet.getTimestamp("created_on"));
                businfo.setSchedule_id(resultSet.getInt("schedule_id"));
                businfo.setDeparture_location(resultSet.getString("departure_location"));
                businfo.setArrival_location(resultSet.getString("arrival_location"));
                businfo.setTake_time(resultSet.getTimestamp("take_time"));
                businfo.setPickup_time(resultSet.getTimestamp("pickup_time"));

                busInfoList.add(businfo);
            }
        } catch (SQLException e) {
            // Handle any database-related exceptions
            e.printStackTrace();
        }
        return busInfoList;
    }

    public int findTotalRecordBySeatAndTime(int seat, Timestamp takeTime, Timestamp pickupTime) throws SQLException {
        int totalRecord = 0;
        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) "
                    + "FROM Bus b "
                    + "JOIN Schedules s ON b.schedule_id = s.id "
                    + "WHERE b.quantity = ? AND b.status = ? AND s.take_time >= ? AND s.pickup_time <= ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, seat);
            preparedStatement.setString(2, "Working");
            preparedStatement.setTimestamp(3, takeTime);
            preparedStatement.setTimestamp(4, pickupTime);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                totalRecord = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecord;
    }

}
//    @Override
//    public List<Businfo> findAll() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    public List<Businfo> findByPage(int page) {
//        String sql = "SELECT \n"
//                + "    b.*,\n"
//                + "    s.departure_location,\n"
//                + "    s.arrival_location,\n"
//                + "    s.take_time,\n"
//                + "    s.pickup_time\n"
//                + "FROM\n"
//                + "    bus b\n"
//                + "JOIN\n"
//                + "    schedules s ON b.schedule_id = s.id\n"
//                + "WHERE b.status = ?\n"
//                + "ORDER BY b.id\n"
//                + "OFFSET ? ROWS\n"
//                + "FETCH NEXT ? ROWS ONLY;";
//
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("status", "Working");
//        parameterMap.put("offset", (page - 1) * Constant.RECORD_PER_PAGE);
//        parameterMap.put("fetch next", Constant.RECORD_PER_PAGE);
//        return queryGenericDAO(Businfo.class, sql, parameterMap);
//    }
//
//    public List<Businfo> findBySeatPageAndTime(int seat, Timestamp takeTime, Timestamp pickupTime, int page) {
//        String sql = "SELECT\n"
//                + "    b.*,\n"
//                + "    s.departure_location,\n"
//                + "    s.arrival_location,\n"
//                + "    s.take_time,\n"
//                + "    s.pickup_time\n"
//                + "FROM\n"
//                + "    Bus b\n"
//                + "JOIN\n"
//                + "    Schedules s ON b.schedule_id = s.id\n"
//                + "WHERE b.quantity = ? AND b.status = ? AND s.take_time >= ? AND s.pickup_time <= ?\n"
//                + "ORDER BY b.id\n"
//                + "OFFSET ? ROWS\n"
//                + "FETCH NEXT ? ROWS ONLY";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("quantity", seat);
//        parameterMap.put("status", "Working");
//        parameterMap.put("take_time", takeTime);
//        parameterMap.put("pickup_time", pickupTime);
//        parameterMap.put("offset", (page - 1) * Constant.RECORD_PER_PAGE);
//        parameterMap.put("fetch next", Constant.RECORD_PER_PAGE);
//        return queryGenericDAO(Businfo.class, sql, parameterMap);
//    }
//
//    public int findTotalRecordBySeatAndTime(int seat, Timestamp takeTime, Timestamp pickupTime) {
//        String sql = "SELECT COUNT(*)\n"
//                + "FROM Bus b\n"
//                + "JOIN\n"
//                + "    Schedules s ON b.schedule_id = s.id\n"
//                + "WHERE b.quantity = ? AND b.status = ? AND s.take_time >= ? AND s.pickup_time <= ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("quantity", seat);
//        parameterMap.put("status", "Working");
//        parameterMap.put("take_time", takeTime);
//        parameterMap.put("pickup_time", pickupTime);
//        return findTotalRecordGenericDAO(Businfo.class, sql, parameterMap);
//    }
