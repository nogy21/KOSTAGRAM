package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kostagram.model.MemberVO;

public class UpdateMemberFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO loginVO = new MemberVO("yang1762", null, "yang1762@gmail.com", "¾ç¼º¿ø", null, null, null);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginVO", loginVO);
		
		request.setAttribute("url", "member/member-update-info-form.jsp");
		return "layout.jsp";
	}

}
