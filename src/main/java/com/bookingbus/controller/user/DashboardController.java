/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookingbus.controller.user;

import com.bookingbus.constant.Constant;
import com.bookingbus.dal.impl.AccountDAO;
import com.bookingbus.dal.impl.BookingDAO;
import com.bookingbus.dal.impl.BookinginfoDAO;
import com.bookingbus.entity.Account;
import com.bookingbus.entity.Booking;
import com.bookingbus.entity.Bookinginfo;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class DashboardController extends HttpServlet {

    AccountDAO accountDAO = new AccountDAO();
    BookingDAO bookingDAO = new BookingDAO();
    BookinginfoDAO bookinginfoDAO = new BookinginfoDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String page = request.getParameter("page") == null ? "" : request.getParameter("page");
        String url = "";
        switch (page) {
            case "profile":
                url = "views/user/dashboard/profile.jsp";
                break;
            case "changepassword":
                url = "views/user/dashboard/changepassword.jsp";
                break;
            case "views-booking":
                Account account = (Account) session.getAttribute(Constant.SESSION_ACCOUNT);
                int id = account.getId();
                List<Bookinginfo> listBooking = bookinginfoDAO.getBookingByAccount(id);
                session.setAttribute("listBooking", listBooking);
                url = "views/user/dashboard/views-booking.jsp";
                break;
            default:
                url = "views/user/dashboard/profile.jsp";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        String url = "";
        switch (action) {
            case "profile":
                updateProfile(request, response);
                url = "views/user/dashboard/profile.jsp";
                break;
            case "changepassword":
                changePassword(request, response);
                url = "views/user/dashboard/changepassword.jsp";
                break;
            case "delete":
                delete(request);
                Account account = (Account) session.getAttribute(Constant.SESSION_ACCOUNT);
                int id = account.getId();
                List<Bookinginfo> listBooking = bookinginfoDAO.getBookingByAccount(id);
                session.setAttribute("listBooking", listBooking);
                url = "views/user/dashboard/views-booking.jsp";
                break;
            default:
                url = "views/user/dashboard/profile.jsp";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String imagePath = "";
        try {
            Part part = request.getPart("image");
            if (part.getSize() > 0) {
                //đường dẫn lưu ảnh
                String path = request.getServletContext().getRealPath("/images");
                File dir = new File(path);
                //ko có đường dẫn => tự tạo ra
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File image = new File(dir, part.getSubmittedFileName());
                part.write(image.getAbsolutePath());
                imagePath = "/BookingBusFA23/images/" + image.getName();
            } else {
                HttpSession session = request.getSession();
                Account accountExisting = (Account) session.getAttribute(Constant.SESSION_ACCOUNT);
                imagePath = accountExisting.getImage();
            }
        } catch (Exception e) {
        }
        Account account = Account.builder()
                .username(username)
                .firstname(firstname)
                .lastname(lastname)
                .phone(phone)
                .address(address)
                .image(imagePath)
                .build();
        accountDAO.updateProfile(account);
        HttpSession session = request.getSession();
        Account accountNew = (Account) session.getAttribute(Constant.SESSION_ACCOUNT);
        request.setAttribute("msg", "Update your account successfully !!");
        accountNew.setFirstname(firstname);
        accountNew.setLastname(lastname);
        accountNew.setPhone(phone);
        accountNew.setAddress(address);
        accountNew.setImage(imagePath);
        session.setAttribute(Constant.SESSION_ACCOUNT, accountNew);
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");

        // Check for empty or null values
        if (username == null || password == null || newPassword == null
                || username.isEmpty() || password.isEmpty() || newPassword.isEmpty()) {
            request.setAttribute("error", "Invalid input. Please fill in all fields.");
            return; // Exit the method to avoid further processing
        }

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute(Constant.SESSION_ACCOUNT);

        // Validate that the provided old password matches the one in the session
        if (password.equals(account.getPassword())) {
            // Update the password
            accountDAO.updatePassword(newPassword, username);
            account.setPassword(newPassword);
            session.setAttribute(Constant.SESSION_ACCOUNT, account);
            request.setAttribute("notice", "Password changed successfully!");
        } else {
            request.setAttribute("error", "Incorrect password");
        }
    }
    
    private void delete(HttpServletRequest request) {
        //get information
        int id = Integer.parseInt(request.getParameter("id"));
        //delete book by id
        bookingDAO.deleteById(id);
        request.setAttribute("msgd", "Delete booking successfully !!");
    }
}
