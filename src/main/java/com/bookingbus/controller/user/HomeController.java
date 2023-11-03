/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookingbus.controller.user;

import com.bookingbus.constant.Constant;
import com.bookingbus.dal.impl.BookingDAO;
import com.bookingbus.dal.impl.BusDAO;
import com.bookingbus.entity.Booking;
import com.bookingbus.entity.Bus;
import com.bookingbus.entity.Pagination;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
public class HomeController extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        String url;
        String page = request.getParameter("page") == null ? "default" : request.getParameter("page");
        switch(page){
            case "403":
                url = "views/user/errorpage/errorpage.jsp";
                break;
            default:
                url = "views/user/homepage/homePage.jsp";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    

}
