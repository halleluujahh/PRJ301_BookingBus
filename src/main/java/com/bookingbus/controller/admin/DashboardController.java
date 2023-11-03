/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookingbus.controller.admin;

import com.bookingbus.constant.Constant;
import com.bookingbus.dal.impl.AccountDAO;
import com.bookingbus.dal.impl.BookingDAO;
import com.bookingbus.dal.impl.BookinginfoDAO;
import com.bookingbus.dal.impl.BusDAO;
import com.bookingbus.dal.impl.ContactDAO;
import com.bookingbus.dal.impl.RoleDAO;
import com.bookingbus.dal.impl.SchedulesDAO;
import com.bookingbus.entity.Account;
import com.bookingbus.entity.Booking;
import com.bookingbus.entity.Bookinginfo;
import com.bookingbus.entity.Bus;
import com.bookingbus.entity.Contact;
import com.bookingbus.entity.Role;
import com.bookingbus.entity.Schedules;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    BusDAO busDAO;
    AccountDAO accountDAO;
    RoleDAO roleDAO;
    BookingDAO bookingDAO;
    BookinginfoDAO bookinginfoDAO;
    SchedulesDAO schedulesDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        busDAO = new BusDAO();
        accountDAO = new AccountDAO();
        roleDAO = new RoleDAO();
        bookinginfoDAO = new BookinginfoDAO();
        schedulesDAO = new SchedulesDAO();
        bookingDAO = new BookingDAO();
        ContactDAO contactDAO = new ContactDAO();

        List<Role> listR;
        List<Schedules> listS;
        List<Contact> listM;
        HttpSession session = request.getSession();
        String page = request.getParameter("page") == null ? "" : request.getParameter("page");
        String url = "";
        switch (page) {
            case "view-bus":
                int countBus = busDAO.countAllBus();
                int countBooking = bookingDAO.countAllBooking();
                int countSchedules = schedulesDAO.countAllSchedules();
                int countAccount = accountDAO.countAllAccount();
                List<Bus> listB = busDAO.findAll();
                session.setAttribute("countBus", countBus);
                session.setAttribute("countBooking", countBooking);
                session.setAttribute("countSchedules", countSchedules);
                session.setAttribute("countAccount", countAccount);
                session.setAttribute("listB", listB);
                url = "../views/admin/dashboard/view-bus.jsp";
                break;
            case "view-users":
                listR = roleDAO.selectRole();
                List<Account> listU = accountDAO.findUsers();
                session.setAttribute("listU", listU);
                session.setAttribute("listR", listR);
                url = "../views/admin/dashboard/view-user.jsp";
                break;
            case "view-admin":
                listR = roleDAO.selectRole();
                List<Account> listA = accountDAO.findAdmin();
                session.setAttribute("listR", listR);
                session.setAttribute("listA", listA);
                url = "../views/admin/dashboard/view-admin.jsp";
                break;
            case "view-booking":
                List<Bookinginfo> listBooking = bookinginfoDAO.getAllBooking();
                session.setAttribute("listBooking", listBooking);
                url = "../views/admin/dashboard/view-booking.jsp";
                break;
            case "view-schedules":
                listS = schedulesDAO.findAll();
                session.setAttribute("listS", listS);
                url = "../views/admin/dashboard/view-schedules.jsp";
                break;
            case "view-message":
                listM = contactDAO.findAll();
                session.setAttribute("listM", listM);
                url = "../views/admin/dashboard/view-message.jsp";
                break;
            default:
                url = "../views/admin/dashboard/view-bus.jsp";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ContactDAO contactDAO = new ContactDAO();
        accountDAO = new AccountDAO();
        bookingDAO = new BookingDAO();
        schedulesDAO = new SchedulesDAO();
        List<Account> listA;
        List<Account> listU;
        List<Bookinginfo> listBooking;
        List<Schedules> listS;
        List<Bus> listB;
        List<Contact> listM;
        HttpSession session = request.getSession();
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        String url = "";
        switch (action) {
            case "edit-user":
                editUser(request, response);
                listU = accountDAO.findUsers();
                session.setAttribute("listU", listU);
                url = "../views/admin/dashboard/view-user.jsp";
                break;
            case "delete-user":
                delete(request, response);
                listU = accountDAO.findUsers();
                session.setAttribute("listU", listU);
                url = "../views/admin/dashboard/view-user.jsp";
                break;
            case "add-user":
                addUser(request, response);
                listU = accountDAO.findUsers();
                session.setAttribute("listU", listU);
                url = "../views/admin/dashboard/view-user.jsp";
                break;
            case "add-admin":
                addAdmin(request, response);
                listA = accountDAO.findAdmin();
                session.setAttribute("listA", listA);
                url = "../views/admin/dashboard/view-admin.jsp";
                break;
            case "delete-admin":
                delete(request, response);
                listA = accountDAO.findAdmin();
                session.setAttribute("listA", listA);
                url = "../views/admin/dashboard/view-admin.jsp";
                break;
            case "edit-admin":
                editAdmin(request, response);
                listA = accountDAO.findAdmin();
                session.setAttribute("listA", listA);
                url = "../views/admin/dashboard/view-admin.jsp";
                break;
            case "delete-booking":
                deleteBooking(request, response);
                listBooking = bookinginfoDAO.getAllBooking();
                session.setAttribute("listBooking", listBooking);
                url = "../views/admin/dashboard/view-booking.jsp";
                break;
            case "edit-booking":
                editBooking(request, response);
                listBooking = bookinginfoDAO.getAllBooking();
                session.setAttribute("listBooking", listBooking);
                url = "../views/admin/dashboard/view-booking.jsp";
                break;
            case "add-schedules":
                addSchedules(request, response);
                listS = schedulesDAO.findAll();
                session.setAttribute("listS", listS);
                url = "../views/admin/dashboard/view-schedules.jsp";
                break;
            case "edit-schedules":
                editSchedules(request, response);
                listS = schedulesDAO.findAll();
                session.setAttribute("listS", listS);
                url = "../views/admin/dashboard/view-schedules.jsp";
                break;
            case "delete-schedules":
                deleteSchedules(request, response);
                listS = schedulesDAO.findAll();
                session.setAttribute("listS", listS);
                url = "../views/admin/dashboard/view-schedules.jsp";
                break;
            case "add-bus":
                addBus(request, response);
                listB = busDAO.findAll();
                session.setAttribute("listB", listB);
                url = "../views/admin/dashboard/view-bus.jsp";
                break;
            case "delete-bus":
                deleteBus(request, response);
                listB = busDAO.findAll();
                session.setAttribute("listB", listB);
                url = "../views/admin/dashboard/view-bus.jsp";
                break;
            case "edit-bus":
                editBus(request, response);
                listB = busDAO.findAll();
                session.setAttribute("listB", listB);
                url = "../views/admin/dashboard/view-bus.jsp";
                break;
            case "delete-message":
                deleteMess(request,response);
                listM = contactDAO.findAll();
                session.setAttribute("listM", listM);
                url = "../views/admin/dashboard/view-message.jsp";
                break;
            default:
                throw new AssertionError();
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        accountDAO = new AccountDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String imagePath = "";

        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        try {
            Part part = request.getPart("image");
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
        } catch (Exception e) {
        }
        Account account = Account.builder()
                .username(username)
                .password(password)
                .firstname(firstname)
                .lastname(lastname)
                .email(email)
                .phone(phone)
                .address(address)
                .created_on(currentTimestamp)
                .roleId(Constant.ROLE_USER)
                .image(imagePath)
                .build();
        boolean isExist = accountDAO.findByUsernameAndEmail(username, email);
        if (!isExist) {
            accountDAO.insert(account);
            request.setAttribute("msg", "Create new user successfully !!");
        } else {
            request.setAttribute("error", "User exist already, please create other !!");
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        String oldUsername = request.getParameter("oldusername");
        String newUsername = request.getParameter("newusername");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int roleId = Integer.parseInt(request.getParameter("role"));
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
                imagePath = request.getParameter("currentImage");
            }
        } catch (Exception e) {
        }
        Account account = Account.builder()
                .username(newUsername)
                .firstname(firstname)
                .lastname(lastname)
                .email(email)
                .phone(phone)
                .address(address)
                .roleId(roleId)
                .image(imagePath)
                .build();
        boolean isExist = accountDAO.findByUsernameAndEmail(newUsername, email);

        if (accountDAO.findAccByOldUsernameAndEmail(oldUsername, email)) {
            accountDAO.editAccount(account, oldUsername);
            request.setAttribute("msge", "Edit user successfully !!");
        } else {
            if (!isExist) {
                accountDAO.editAccount(account, oldUsername);
                request.setAttribute("msge", "Edit user successfully !!");
            } else {
                request.setAttribute("error", "User exist already, please edit different from remaining users !!");
            }

        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        accountDAO.deleteById(id);
        request.setAttribute("msgd", "Delete account successfully !!");
    }

    private void deleteBooking(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        bookingDAO.deleteById(id);
        request.setAttribute("msgd", "Delete booking successfully !!");
    }

    private void addAdmin(HttpServletRequest request, HttpServletResponse response) {
        accountDAO = new AccountDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String imagePath = "";

        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        try {
            Part part = request.getPart("image");
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
        } catch (Exception e) {
        }
        Account account = Account.builder()
                .username(username)
                .password(password)
                .firstname(firstname)
                .lastname(lastname)
                .email(email)
                .phone(phone)
                .address(address)
                .created_on(currentTimestamp)
                .roleId(Constant.ROLE_ADMIN)
                .image(imagePath)
                .build();
        boolean isExist = accountDAO.findByUsernameAndEmail(username, email);
        if (!isExist) {
            accountDAO.insert(account);
            request.setAttribute("msg", "Create new admin successfully !!");
        } else {
            request.setAttribute("error", "Admin exist already, please create other !!");
        }
    }

    private void editAdmin(HttpServletRequest request, HttpServletResponse response) {
        String oldUsername = request.getParameter("oldusername");
        String newUsername = request.getParameter("newusername");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int roleId = Integer.parseInt(request.getParameter("role"));
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
                imagePath = request.getParameter("currentImage");
            }
        } catch (Exception e) {
        }
        Account account = Account.builder()
                .username(newUsername)
                .firstname(firstname)
                .lastname(lastname)
                .email(email)
                .phone(phone)
                .address(address)
                .roleId(roleId)
                .image(imagePath)
                .build();
        boolean isExist = accountDAO.findByUsernameAndEmail(newUsername, email);
        if (accountDAO.findAccByOldUsernameAndEmail(oldUsername, email)) {
            accountDAO.editAccount(account, oldUsername);
            request.setAttribute("msge", "Edit admin successfully !!");
        } else {
            if (!isExist) {
                accountDAO.editAccount(account, oldUsername);
                request.setAttribute("msge", "Edit admin successfully !!");
            } else {
                request.setAttribute("error", "Admin exist already, please edit different from remaining admin !!");
            }
        }
    }

    private void editBooking(HttpServletRequest request, HttpServletResponse response) {
        String status = request.getParameter("status");
        String bookingID = request.getParameter("bookingid");
        bookingDAO.updateStatus(status, bookingID);
        request.setAttribute("msge", "Edit booking successfully !!");
    }

    private void addSchedules(HttpServletRequest request, HttpServletResponse response) {
        schedulesDAO = new SchedulesDAO();
        String departureLocation = request.getParameter("departureLocation");
        String arrivalLocation = request.getParameter("arrivalLocation");
        String takeTimeStr = request.getParameter("takeTime");
        String pickupTimeStr = request.getParameter("pickupTime");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

        try {
            Date takeTimeDate = dateFormat.parse(takeTimeStr);
            Date pickupTimeDate = dateFormat.parse(pickupTimeStr);

            // Convert the Date objects to Timestamp
            Timestamp takeTime = new Timestamp(takeTimeDate.getTime());
            Timestamp pickupTime = new Timestamp(pickupTimeDate.getTime());
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

            // Now you have the Timestamp objects for takeTime and pickupTime
            Schedules schedules = Schedules.builder()
                    .departure_location(departureLocation)
                    .arrival_location(arrivalLocation)
                    .take_time(takeTime)
                    .pickup_time(pickupTime)
                    .created_on(currentTimestamp)
                    .build();

            boolean isExist = schedulesDAO.findSchedulesExist(departureLocation, arrivalLocation, takeTime, pickupTime);

            if (!isExist) {
                schedulesDAO.insert(schedules);
                request.setAttribute("msg", "Create new schedules successfully !!");
            } else {
                request.setAttribute("error", "Schedules exist already, please create another schedules !!");
            }
        } catch (ParseException e) {
            // Handle parsing exception
            e.printStackTrace(); // Print the exception for debugging
            // You can add error handling logic here, e.g., sending an error message to the user.
        }
    }

    private void editSchedules(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("schedulesid");
        String departureLocation = request.getParameter("departureLocation");
        String arrivalLocation = request.getParameter("arrivalLocation");
        String takeTimeStr = request.getParameter("takeTime");
        String pickupTimeStr = request.getParameter("pickupTime");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

        try {
            Date takeTimeDate = dateFormat.parse(takeTimeStr);
            Date pickupTimeDate = dateFormat.parse(pickupTimeStr);

            // Convert the Date objects to Timestamp
            Timestamp takeTime = new Timestamp(takeTimeDate.getTime());
            Timestamp pickupTime = new Timestamp(pickupTimeDate.getTime());
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

            // Now you have the Timestamp objects for takeTime and pickupTime
            Schedules schedules = Schedules.builder()
                    .departure_location(departureLocation)
                    .arrival_location(arrivalLocation)
                    .take_time(takeTime)
                    .pickup_time(pickupTime)
                    .created_on(currentTimestamp)
                    .build();

            schedulesDAO.editSchedules(schedules, id);
            request.setAttribute("msge", "Edit schedules successfully !!");
        } catch (ParseException e) {
            // Handle parsing exception
            e.printStackTrace(); // Print the exception for debugging
            // You can add error handling logic here, e.g., sending an error message to the user.
        }
    }

    private void deleteSchedules(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        schedulesDAO.deleteById(id);
        request.setAttribute("msgd", "Delete schedules successfully !!");
    }

    private void addBus(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String phone = request.getParameter("phone");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        int scheduleid = Integer.parseInt(request.getParameter("scheduleid"));

        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

        boolean scheduleExists = schedulesDAO.findScheduleExistByID(scheduleid);
        if (!scheduleExists) {
            request.setAttribute("error", "Schedule with ID " + scheduleid + " does not exist.");
        } else {
            Bus bus = Bus.builder()
                    .name(name)
                    .price(price)
                    .phone(phone)
                    .quantity(quantity)
                    .description(description)
                    .status(status)
                    .created_on(currentTimestamp)
                    .schedule_id(scheduleid).build();
            boolean isExist = busDAO.findBusExistByNameAndSchedulesID(name, scheduleid);
            if (!isExist) {
                if (!busDAO.findExistSchedulesID(scheduleid)) {
                    busDAO.insert(bus);
                    request.setAttribute("msg", "Create new bus successfully !!");
                } else {
                    request.setAttribute("error", "This schedules is already belong to a bus");
                }
            } else {
                request.setAttribute("error", "Bus exist already, please create another bus !!");
            }
        }
    }

    private void deleteBus(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        busDAO.deleteById(id);
        request.setAttribute("msgd", "Delete bus successfully !!");
    }

    private void editBus(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("busid"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String phone = request.getParameter("phone");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        int scheduleid = Integer.parseInt(request.getParameter("scheduleid"));
        boolean scheduleExists = schedulesDAO.findScheduleExistByID(scheduleid);
        if (!scheduleExists) {
            request.setAttribute("error", "Schedule with ID " + scheduleid + " does not exist.");
        } else {
            Bus bus = Bus.builder()
                    .name(name)
                    .price(price)
                    .phone(phone)
                    .quantity(quantity)
                    .description(description)
                    .status(status)
                    .schedule_id(scheduleid).build();

            if (busDAO.findExistSchedulesIdByBus(scheduleid, id)) {
                busDAO.editBus(bus, id);
                request.setAttribute("msge", "Edit bus successfully !!");
            } else {
                if (!busDAO.findExistSchedulesID(scheduleid)) {
                    busDAO.editBus(bus, id);
                    request.setAttribute("msge", "Edit bus successfully !!");
                } else {
                    request.setAttribute("errore", "This schedules is already belong to a bus");
                }
            }
        }
    }

    private void deleteMess(HttpServletRequest request, HttpServletResponse response) {
        ContactDAO contactDAO = new ContactDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        contactDAO.deleteById(id);
        request.setAttribute("msgd", "Delete message successfully !!");
    }
}
