/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookingbus.dal.impl;

import com.bookingbus.dal.DBContext;
import com.bookingbus.entity.Account;
import com.bookingbus.entity.Booking;
import com.bookingbus.entity.Bookinginfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LENOVO
 */
public class BookingDAO extends DBContext {

    public boolean findByAccountAndBusId(int accountID, int busID) {
        try {
            Connection connection = getConnection();

            String sql = "SELECT COUNT(*) FROM Booking WHERE account_id = ? AND bus_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, accountID);
            preparedStatement.setInt(2, busID);

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            int count = resultSet.getInt(1);

            resultSet.close();
            preparedStatement.close();

            return count > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int insert(Booking booking) {
        try {
            Connection connection = getConnection();

            String sql = "INSERT INTO Booking (account_id, bus_id, created_on, quantity, total_price, status) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, booking.getAccount_id());
            preparedStatement.setInt(2, booking.getBus_id());
            preparedStatement.setTimestamp(3, booking.getCreated_on());
            preparedStatement.setInt(4, booking.getQuantity());
            preparedStatement.setInt(5, booking.getTotal_price());
            preparedStatement.setString(6, booking.getStatus());

            int rowsInserted = preparedStatement.executeUpdate();

            preparedStatement.close();

            return rowsInserted;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public void deleteById(int id) {
        try {
            Connection connection = getConnection();

            String sql = "DELETE FROM Booking WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            int rowsDeleted = preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateStatus(String status, String bookingID) {
        try {
            Connection connection = getConnection();

            String sql = "UPDATE Booking SET status = ? WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, status);
            preparedStatement.setString(2, bookingID);

            int rowsUpdated = preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException e) {
            // Handle any database-related exceptions
            e.printStackTrace();
        }
    }

    public int getTotalBooked(int busID) {

        try {
            Connection connection = getConnection();

            String sql = "SELECT SUM(quantity) AS total_quantity FROM [dbo].[Booking] WHERE bus_id = ? AND status = 'Progress' OR status = 'Confirmed'";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, busID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int totalQuantity = resultSet.getInt("total_quantity");
                return totalQuantity;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int countAllBooking() {
        int count = 0;
        try {
            connection = this.getConnection();
            
            String sql = "SELECT COUNT(*) FROM booking";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
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
//    public List<Booking> findAll() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    public boolean findByAccountAndBusId(int accountID, int busID) {
//        String sql = "SELECT * FROM [Booking]\n"
//                + "WHERE account_id = ? AND bus_id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("account_id", accountID);
//        parameterMap.put("bus_id", busID);
//        List<Booking> list = queryGenericDAO(Booking.class, sql, parameterMap);
//        return !list.isEmpty();
//    }
//
//    public int insert(Booking t) {
//        return insertGenericDAO(t);
//    }
//
//    public void deleteById(int id) {
//        String sql = "DELETE FROM [dbo].[Booking]\n"
//                + "      WHERE id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("id", id);
//        updateGenericDAO(sql, parameterMap);
//    }
//
//    public void updateStatus(String status, String bookingID) {
//        String sql = "UPDATE [dbo].[Booking]\n"
//                + "   SET [status] = ?\n"
//                + " WHERE id = ?";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("status", status);
//        parameterMap.put("id", bookingID);
//        updateGenericDAO(sql, parameterMap);
//    }

