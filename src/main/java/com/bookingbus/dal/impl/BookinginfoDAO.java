/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookingbus.dal.impl;

import com.bookingbus.dal.DBContext;
import com.bookingbus.entity.Bookinginfo;
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
public class BookinginfoDAO extends DBContext{
    
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    public List<Bookinginfo> getAllBooking() {
    

    List<Bookinginfo> list = new ArrayList<>();

    try {
        connection = this.getConnection();

        String sql = "SELECT Bu.name, Bu.price, A.username, A.email, A.phone, S.departure_location, S.arrival_location, S.take_time, S.pickup_time, B.* FROM Booking AS B " +
                     "JOIN Bus AS Bu ON B.bus_id = Bu.id " +
                     "JOIN Account AS A ON B.account_id = A.id " +
                     "JOIN Schedules AS S ON Bu.schedule_id = S.id";
        
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            Bookinginfo bookinginfo = new Bookinginfo();
            bookinginfo.setId(resultSet.getInt("id"));
            bookinginfo.setAccount_id(resultSet.getInt("account_id"));
            bookinginfo.setBus_id(resultSet.getInt("bus_id"));
            bookinginfo.setCreated_on(resultSet.getTimestamp("created_on"));
            bookinginfo.setQuantity(resultSet.getInt("quantity"));
            bookinginfo.setTotal_price(resultSet.getInt("total_price"));
            bookinginfo.setStatus(resultSet.getString("status"));
            bookinginfo.setUsername(resultSet.getString("username"));
            bookinginfo.setEmail(resultSet.getString("email"));
            bookinginfo.setPhone(resultSet.getString("phone"));
            bookinginfo.setName(resultSet.getString("name"));
            bookinginfo.setPrice(resultSet.getInt("price"));
            bookinginfo.setDeparture_location(resultSet.getString("departure_location"));
            bookinginfo.setArrival_location(resultSet.getString("arrival_location"));
            bookinginfo.setTake_time(resultSet.getTimestamp("take_time"));
            bookinginfo.setPickup_time(resultSet.getTimestamp("pickup_time"));

            list.add(bookinginfo);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } 
    return list;
}

    public List<Bookinginfo> getBookingByAccount(int id) {
    List<Bookinginfo> list = new ArrayList<>();

    try {
        connection = this.getConnection(); 

        String sql = "SELECT Bu.name, Bu.price, A.username, A.email, A.phone, S.departure_location, S.arrival_location, S.take_time, S.pickup_time, B.* FROM Booking AS B " +
                     "JOIN Bus AS Bu ON B.bus_id = Bu.id " +
                     "JOIN Account AS A ON B.account_id = A.id " +
                     "JOIN Schedules AS S ON Bu.schedule_id = S.id " +
                     "WHERE B.account_id = ?";
        
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            Bookinginfo bookinginfo = new Bookinginfo();
            bookinginfo.setId(resultSet.getInt("id"));
            bookinginfo.setAccount_id(resultSet.getInt("account_id"));
            bookinginfo.setBus_id(resultSet.getInt("bus_id"));
            bookinginfo.setCreated_on(resultSet.getTimestamp("created_on"));
            bookinginfo.setQuantity(resultSet.getInt("quantity"));
            bookinginfo.setTotal_price(resultSet.getInt("total_price"));
            bookinginfo.setStatus(resultSet.getString("status"));
            bookinginfo.setUsername(resultSet.getString("username"));
            bookinginfo.setEmail(resultSet.getString("email"));
            bookinginfo.setPhone(resultSet.getString("phone"));
            bookinginfo.setName(resultSet.getString("name"));
            bookinginfo.setPrice(resultSet.getInt("price"));
            bookinginfo.setDeparture_location(resultSet.getString("departure_location"));
            bookinginfo.setArrival_location(resultSet.getString("arrival_location"));
            bookinginfo.setTake_time(resultSet.getTimestamp("take_time"));
            bookinginfo.setPickup_time(resultSet.getTimestamp("pickup_time"));

            list.add(bookinginfo);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return list;
}

}
//    @Override
//    public List<Bookinginfo> findAll() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    public List<Bookinginfo> getAllBooking() {
//        String sql = "SELECT Bu.name, Bu.price, A.username, A.email, A.phone, S.departure_location, S.arrival_location, S.take_time, S.pickup_time, B.* FROM Booking AS B \n"
//                + "JOIN Bus AS Bu ON B.bus_id = Bu.id \n"
//                + "JOIN Account AS A ON B.account_id = A.id \n"
//                + "JOIN Schedules AS S ON Bu.schedule_id = S.id";
//        parameterMap = new LinkedHashMap<>();
//        List<Bookinginfo> list = queryGenericDAO(Bookinginfo.class, sql, parameterMap);
//        return list;
//    }
//
//    public List<Bookinginfo> getBookingByAccount(int id) {
//        String sql = "SELECT Bu.name, Bu.price, A.username, A.email, A.phone, S.departure_location,S.arrival_location,S.take_time,S.pickup_time, B.* FROM Booking AS B \n"
//                + "JOIN Bus AS Bu ON B.bus_id = Bu.id \n"
//                + "JOIN Account AS A ON B.account_id = A.id \n"
//                + "JOIN Schedules AS S ON Bu.schedule_id = S.id \n"
//                + "WHERE B.account_id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("account_id", id);
//        List<Bookinginfo> list = queryGenericDAO(Bookinginfo.class, sql, parameterMap);
//        return list;
//    }
    
