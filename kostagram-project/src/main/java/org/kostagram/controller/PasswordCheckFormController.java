package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PasswordCheckFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("url", "member/checkpassword-form.jsp");
		return "layout.jsp";
	}
}
