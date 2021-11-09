package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.MemberDAO;

public class PasswordModifyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String newPassword = request.getParameter("newpassword");
		String memberId = request.getParameter("memberId");
		MemberDAO.getInstance().modifypassword(memberId, newPassword);
		request.setAttribute("url", "main.jsp");
		return "layout.jsp";
	}
}
