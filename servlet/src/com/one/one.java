package com.one;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class one
 */
@WebServlet("/one")
public class one extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public one() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		System.out.println("start");
	}

	public void destroy() {
		System.out.println("end");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		
		request.setAttribute("msg", request.getParameter("msg"));
		RequestDispatcher view = request.getRequestDispatcher("oneGet.jsp");
		view.forward(request, response);
		destroy();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
	}

}
