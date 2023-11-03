/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookingbus.controller.user;

import com.bookingbus.constant.Constant;
import com.bookingbus.dal.impl.AccountDAO;
import com.bookingbus.entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.taglibs.standard.lang.jstl.Constants;

/**
 *
 * @author LENOVO
 */
public class AuthentController extends HttpServlet {

    AccountDAO accountDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "login" : request.getParameter("action");
        String url;
        switch (action) {
            case "login":
                Cookie arr[] = request.getCookies();
                if (arr != null) {
                    for (Cookie o : arr) {
                        if (o.getName().equals("userC")) {
                            request.setAttribute("username", o.getValue());
                        }
                        if (o.getName().equals("passC")) {
                            request.setAttribute("password", o.getValue());
                        }
                    }
                }
                url = "views/user/login/login.jsp";
                break;
            case "register":
                url = "views/user/login/register.jsp";
                break;
            case "logout":
                logout(request, response);
                url = "home";
                break;
            default:
                url = "login";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "login" : request.getParameter("action");
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    public static boolean containsSpecialCharacters(String input) {
        String specialCharactersPattern = ".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?].*";
        Pattern pattern = Pattern.compile(specialCharactersPattern);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        accountDAO = new AccountDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        Account account = Account.builder()
                .username(username)
                .password(password)
                .build();
        //kiem tra acc ton tai db
        account = accountDAO.findAccountByNamePass(account);
        //neu account khong ton tai, se hien thong bao loi 
        if (account == null) {
            request.setAttribute("error", "Username or password incorrect !");
            request.getRequestDispatcher("views/user/login/login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute(Constant.SESSION_ACCOUNT, account);
            Cookie u = new Cookie("userC", username);
            Cookie p = new Cookie("passC", password);
            if (remember != null) {
                u.setMaxAge(60 * 60 * 24);
                p.setMaxAge(60 * 60 * 24);
            } else {
                u.setMaxAge(0);
                p.setMaxAge(0);
            }
            response.addCookie(u);
            response.addCookie(p);
            response.sendRedirect("home");
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        accountDAO = new AccountDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String email = request.getParameter("email");

        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        if (containsSpecialCharacters(username)) {
            request.setAttribute("error", "Username contains special characters. Please choose another.");
            request.getRequestDispatcher("views/user/login/register.jsp").forward(request, response);
            return; 
        }

        if (password.equals(password2)) {
            if (containsSpecialCharacters(password)) {
                request.setAttribute("error", "Password contains special characters. Please choose another.");
                request.getRequestDispatcher("views/user/login/register.jsp").forward(request, response);
                return; 
            }
            Account account = Account.builder()
                    .username(username)
                    .password(password)
                    .email(email)
                    .created_on(currentTimestamp)
                    .roleId(Constant.ROLE_USER)
                    .build();
            boolean isExist = accountDAO.findByUsernameAndEmail(username, email);
            if (!isExist) {
                accountDAO.insert(account);
                request.getRequestDispatcher("views/user/login/login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Account exists, please choose another username or email.");
                request.getRequestDispatcher("views/user/login/register.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Password and re-entered password do not match.");
            request.getRequestDispatcher("views/user/login/register.jsp").forward(request, response);
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute(Constant.SESSION_ACCOUNT);
    }

}
