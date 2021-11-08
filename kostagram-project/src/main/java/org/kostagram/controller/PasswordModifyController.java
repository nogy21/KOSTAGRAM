package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kostagram.model.MemberDAO;
import org.kostagram.model.MemberVO;

public class PasswordModifyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String newpassword = request.getParameter("newpassword");
		MemberVO passwordvo = new MemberVO("jw", newpassword);
		MemberDAO.getInstance().modifypassword(passwordvo);
		session.setAttribute("loginvo", passwordvo);
		request.setAttribute("url", "main.jsp");
		return "layout.jsp";
	}
}
