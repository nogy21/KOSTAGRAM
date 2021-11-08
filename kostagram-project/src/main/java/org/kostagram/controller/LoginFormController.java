package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFormController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("url", "member/login-form.jsp");
		return "layout.jsp";//레이아웃적용
	}
}
