/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookingbus.controller.user;

import com.bookingbus.dal.impl.ContactDAO;
import com.bookingbus.entity.Contact;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
public class ContactController extends HttpServlet {

    ContactDAO contactDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/user/contact/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        contactDAO = new ContactDAO();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        int accountID = 0;
        
        String accountIDParam = request.getParameter("accountID");
        if (accountIDParam != null && !accountIDParam.isEmpty()) {
            accountID = Integer.parseInt(accountIDParam);
        }
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        if (accountID==0) {
            Contact contact = Contact.builder()
                    .name(name)
                    .email(email)
                    .subject(subject)
                    .message(message)
                    .created_on(currentTimestamp)
                    .build();
            contactDAO.insertContact(contact);
        } else {
            Contact contact = Contact.builder()
                    .name(name)
                    .email(email)
                    .subject(subject)
                    .message(message)
                    .created_on(currentTimestamp)
                    .account_id(accountID)
                    .build();
            contactDAO.insertContact(contact);
        }
        request.setAttribute("msg", "Send message successfully !!");
        request.getRequestDispatcher("views/user/contact/contact.jsp").forward(request, response);
    }

}
