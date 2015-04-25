package edu.neu.cs5200.mystereo.ser;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.neu.cs5200.mystereo.models.*;
import edu.neu.cs5200.mystereo.DAO.*;


public class seruserregister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public seruserregister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");
    
        String userSex = request.getParameter("userSex");
        String userDescribe = request.getParameter("userDescribe");

        User user = new User();
     
        user.setUsername(userName);
        user.setPassword(userPassword);
        user.setUsername(userName);

        user.setSex(userSex);
        user.setDescription(userDescribe);
        user.setType("user");
        UserDao userDao = new UserDao();

        userDao.insertUser(user);

        request.getRequestDispatcher("/userlogin.jsp").forward(request,
                response);
    }

	

}
