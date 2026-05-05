package com.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/UserDataServlet")
public class UserDataServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String designation = request.getParameter("designation");

        // Server-side validation
        if (username == null || username.isEmpty() ||
            email == null || email.isEmpty() ||
            designation == null || designation.isEmpty()) {

            response.getWriter().println("Error: All fields are required!");
            return;
        }

        if (!email.contains("@")) {
            response.getWriter().println("Error: Invalid Email!");
            return;
        }

        // Store data in request
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("designation", designation);

        // Forward to result.jsp
        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
    }
}