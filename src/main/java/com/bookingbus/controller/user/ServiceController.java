/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookingbus.controller.user;

import com.bookingbus.constant.Constant;
import com.bookingbus.dal.impl.BookingDAO;
import com.bookingbus.dal.impl.BusDAO;
import com.bookingbus.dal.impl.BusinfoDAO;
import com.bookingbus.entity.Booking;
import com.bookingbus.entity.Bus;
import com.bookingbus.entity.Businfo;
import com.bookingbus.entity.Pagination;
import java.io.IOException;
import java.sql.SQLException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
public class ServiceController extends HttpServlet {

    BusDAO busDAO;
    BookingDAO bookingDAO;
    BusinfoDAO businfoDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Pagination pagination = new Pagination();
        List<Businfo> listB = null;
        try {
            listB = pagination(request, pagination);
        } catch (SQLException ex) {
            Logger.getLogger(ServiceController.class.getName()).log(Level.SEVERE, null, ex);
        }
        session.setAttribute("listBus", listB);
        request.setAttribute("pagination", pagination);
//        System.out.println(pagination);
        request.getRequestDispatcher("views/user/service/service.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Businfo> listB = null;
        String url;
        Pagination pagination = new Pagination();
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        switch (action) {
            case "booking":
                bookingBus(request, response);
                try {
                    listB = pagination(request, pagination);
                } catch (SQLException ex) {
                    Logger.getLogger(ServiceController.class.getName()).log(Level.SEVERE, null, ex);
                }
                session.setAttribute("listBus", listB);
                request.setAttribute("pagination", pagination);
                break;

            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher("views/user/service/service.jsp").forward(request, response);
    }

    private List<Businfo> pagination(HttpServletRequest request, Pagination pagination) throws SQLException {
        busDAO = new BusDAO();
        businfoDAO = new BusinfoDAO();
        HttpSession session = request.getSession();
        String pageRaw = request.getParameter("pagination");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
        } catch (Exception e) {
            page = 1;
        }
        int totalBus = 0;
        List<Businfo> listB = null;
        String action = request.getParameter("action") == null ? "defaultFindAll" : request.getParameter("action");
        switch (action) {
            case "booking":
                totalBus = busDAO.findTotalBus();
                listB = businfoDAO.findByPage(page);
                pagination.setUrlPattern("service?action=booking&");
                break;
            case "search":
                String takeTimeStr = request.getParameter("take-time");
                String pickupTimeStr = request.getParameter("pickup-time");

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

                try {
                    Date takeTimeDate = dateFormat.parse(takeTimeStr);
                    Date pickupTimeDate = dateFormat.parse(pickupTimeStr);

                    Timestamp takeTime = new Timestamp(takeTimeDate.getTime());
                    Timestamp pickupTime = new Timestamp(pickupTimeDate.getTime());
                    int seat = Integer.parseInt(request.getParameter("seat-quantity"));
                    totalBus = businfoDAO.findTotalRecordBySeatAndTime(seat, takeTime, pickupTime);
                    listB = businfoDAO.findBySeatPageAndTime(seat, takeTime, pickupTime, page);
                    pagination.setUrlPattern("service?action=search&seat-quantity=" + seat + "&" + "take-time=" + takeTime + "&" + "pickup-time=" + pickupTime + "&");
                    break;
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            default:
                totalBus = busDAO.findTotalBus();
                listB = businfoDAO.findByPage(page);
                pagination.setUrlPattern("service?");
        }
        int totalPage = (totalBus % Constant.RECORD_PER_PAGE) == 0
                ? (totalBus / Constant.RECORD_PER_PAGE)
                : (totalBus / Constant.RECORD_PER_PAGE) + 1;
        pagination.setPage(page);
        pagination.setTotalPage(totalPage);
        pagination.setTotalRecord(totalBus);
        return listB;
    }

    private void bookingBus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        bookingDAO = new BookingDAO();
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int price = Integer.parseInt(request.getParameter("price"));
        int busID = Integer.parseInt(request.getParameter("busId"));
        int accountID = Integer.parseInt(request.getParameter("accountId"));
        String status = request.getParameter("status");
        int busquantity = Integer.parseInt(request.getParameter("busquantity"));
        //cal total price by quantity
        int totalPrice = price * quantity;

        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

        Booking booking = Booking.builder()
                .account_id(accountID)
                .bus_id(busID)
                .created_on(currentTimestamp)
                .quantity(quantity)
                .total_price(totalPrice)
                .status(status)
                .build();
        boolean isExist = bookingDAO.findByAccountAndBusId(accountID, busID);
        if (!isExist) {
            int totalBooked = bookingDAO.getTotalBooked(busID);
            int remainingSeats = busquantity - totalBooked;
            if (quantity <= remainingSeats) { 
                bookingDAO.insert(booking);
                request.setAttribute("msg", "Booking successfully!");
            } else {
                request.setAttribute("error", "This bus is out of reservations!! Please search for another bus.");
            }
        } else {
            request.setAttribute("error", "You've already booked this bus! Please visit the booking view section.");
        }

    }

}
