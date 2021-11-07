package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GenericController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("url", "generic.jsp");
		return "layout.jsp";
	}
}
