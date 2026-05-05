package com.cookie;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.net.URLEncoder;
import java.net.URLDecoder;

@WebServlet("/cookieDemo")
public class CookieServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("username");
        int visitCount = 1;

        // Encode name (fix for spaces)
        if (name != null) {
            name = URLEncoder.encode(name, "UTF-8");
        }

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie c : cookies) {

                if (c.getName().equals("visitCount")) {
                    visitCount = Integer.parseInt(c.getValue()) + 1;
                }

                if (c.getName().equals("username")) {
                    name = c.getValue();
                }
            }
        }

        // Decode name for display
        String decodedName = URLDecoder.decode(name, "UTF-8");

        // Create cookies
        Cookie nameCookie = new Cookie("username", name);
        Cookie countCookie = new Cookie("visitCount", String.valueOf(visitCount));

        // Expiry = 60 seconds
        nameCookie.setMaxAge(60);
        countCookie.setMaxAge(60);

        response.addCookie(nameCookie);
        response.addCookie(countCookie);

        // Output
        out.println("<html><body>");

        out.println("<h2>Welcome back " + decodedName + "!</h2>");
        out.println("<h3>You have visited this page " + visitCount + " times.</h3>");
        out.println("<p><i>(Cookie expires in 60 seconds)</i></p>");

        // Display cookie list
        out.println("<h3>List of Cookies:</h3>");

        if (cookies != null) {
            for (Cookie c : cookies) {

                String cname = c.getName();
                String cvalue = URLDecoder.decode(c.getValue(), "UTF-8");

                out.println("<p>");
                out.println("Name: " + cname + "<br>");
                out.println("Value: " + cvalue + "<br>");
                out.println("Max Age: " + c.getMaxAge());
                out.println("</p><hr>");
            }
        } else {
            out.println("<p>No Cookies Found</p>");
        }

        out.println("</body></html>");
    }
}