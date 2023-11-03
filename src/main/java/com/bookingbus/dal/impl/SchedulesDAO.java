/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookingbus.dal.impl;

import com.bookingbus.dal.DBContext;
import com.bookingbus.entity.Schedules;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class SchedulesDAO extends DBContext {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public List<Schedules> findAll() {
        List<Schedules> schedulesList = new ArrayList<>();

        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Schedules ORDER BY id";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Schedules schedule = new Schedules();
                schedule.setId(resultSet.getInt("id"));
                schedule.setDeparture_location(resultSet.getString("departure_location"));
                schedule.setArrival_location(resultSet.getString("arrival_location"));
                schedule.setTake_time(resultSet.getTimestamp("take_time"));
                schedule.setPickup_time(resultSet.getTimestamp("pickup_time"));
                schedule.setCreated_on(resultSet.getTimestamp("created_on"));

                schedulesList.add(schedule);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedulesList;
    }

    public boolean findSchedulesExist(String departureLocation, String arrivalLocation, Timestamp takeTime, Timestamp pickupTime) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Schedules WHERE departure_location = ? AND arrival_location = ? AND take_time = ? AND pickup_time = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, departureLocation);
            preparedStatement.setString(2, arrivalLocation);
            preparedStatement.setTimestamp(3, takeTime);
            preparedStatement.setTimestamp(4, pickupTime);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int insert(Schedules schedules) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Schedules (departure_location, arrival_location, take_time, pickup_time, created_on) VALUES (?, ?, ?, ?, ?)";

            // Create a PreparedStatement with the SQL query
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, schedules.getDeparture_location());
            preparedStatement.setString(2, schedules.getArrival_location());
            preparedStatement.setTimestamp(3, schedules.getTake_time());
            preparedStatement.setTimestamp(4, schedules.getPickup_time());
            preparedStatement.setTimestamp(5, schedules.getCreated_on());

            int rowsAffected = preparedStatement.executeUpdate();

            // Close the PreparedStatement when you're done
            preparedStatement.close();

            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public void editSchedules(Schedules schedules, String id) {
        try {
            connection = this.getConnection(); // Assuming you have a method to get the database connection
            String sql = "UPDATE Schedules SET departure_location = ?, arrival_location = ?, take_time = ?, pickup_time = ? WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, schedules.getDeparture_location());
            preparedStatement.setString(2, schedules.getArrival_location());
            preparedStatement.setTimestamp(3, schedules.getTake_time());
            preparedStatement.setTimestamp(4, schedules.getPickup_time());
            preparedStatement.setString(5, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            // Handle any database-related exceptions
            e.printStackTrace();
        }
    }

    public void deleteById(int id) {
        try {
            connection = this.getConnection();
            String sql = "DELETE FROM Schedules WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean findScheduleExistByID(int scheduleid) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Schedules WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, scheduleid);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int countAllSchedules() {
        int count = 0;
        try {
            connection = this.getConnection();
            
            String sql = "SELECT COUNT(*) FROM Schedules";
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
//    public List<Schedules> findAll() {
//        String sql = "SELECT s.* FROM Schedules s ORDER BY s.id\n";
//        parameterMap = new LinkedHashMap<>();
//        return queryGenericDAO(Schedules.class, sql, parameterMap);
//    }
//
//    public boolean findSchedulesExist(String departureLocation, String arrivalLocation, Timestamp takeTime, Timestamp pickupTime) {
//        String sql = "SELECT * FROM Schedules s "
//                + "WHERE s.departure_location = ? "
//                + "AND s.arrival_location = ? "
//                + "AND s.take_time = ? "
//                + "AND s.pickup_time = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("departureLocation", departureLocation);
//        parameterMap.put("arrivalLocation", arrivalLocation);
//        parameterMap.put("takeTime", takeTime);
//        parameterMap.put("pickupTime", pickupTime);
//        List<Schedules> list = queryGenericDAO(Schedules.class, sql, parameterMap);
//        return !list.isEmpty();
//    }
//
//    public int insert(Schedules schedules) {
//        return insertGenericDAO(schedules);
//    }
//
//    public void editSchedules(Schedules schedules, String id) {
//        String sql = "UPDATE [dbo].[Schedules]\n"
//                + "   SET [departure_location] = ?\n"
//                + "      ,[arrival_location] = ?\n"
//                + "      ,[take_time] = ?\n"
//                + "      ,[pickup_time] = ?\n"
//                + " WHERE id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("departure_location", schedules.getDeparture_location());
//        parameterMap.put("arrival_location", schedules.getArrival_location());
//        parameterMap.put("take_time", schedules.getTake_time());
//        parameterMap.put("pickup_time", schedules.getPickup_time());
//        parameterMap.put("id", id);
//        updateGenericDAO(sql, parameterMap);
//    }
//
//    public void deleteById(int id) {
//        String sql = "DELETE FROM [dbo].[Schedules]\n"
//                + "      WHERE id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("id", id);
//        updateGenericDAO(sql, parameterMap);
//    }
//
//    public boolean findScheduleExistByID(int scheduleid) {
//        String sql = "SELECT * FROM Schedules s\n"
//                + "WHERE id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("id", scheduleid);
//        List<Schedules> list = queryGenericDAO(Schedules.class, sql, parameterMap);
//        return !list.isEmpty();
//    }

