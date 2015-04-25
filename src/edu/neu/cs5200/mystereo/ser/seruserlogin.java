package edu.neu.cs5200.mystereo.ser;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.neu.cs5200.mystereo.models.*;
import edu.neu.cs5200.mystereo.DAO.*;

public class seruserlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public seruserlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");
        UserDao userDao = new UserDao();
        List<User> user = userDao.judgeUserPassword(userName, userPassword);
        int uid=1;
        String message = "ERROR~��";
        if (user.size()<1) {
     
            request.setAttribute("message", message);
            request.getRequestDispatcher("/userlogin.jsp").forward(request,
                    response);
        } else {
        	for (User u :user)
        	{
        		uid=u.getuId();
        	}
        	
        	 request.setAttribute("message",uid+"");
            request.getRequestDispatcher("/loginsuccess.jsp").forward(request,
                    response);
        }

    }

	


}
