package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.MemberDAO;

public class UpdateMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberId = request.getParameter("memberId");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		MemberDAO.getInstance().UpdateMember(memberId, email, name);
		
		return "redirect:MainController.do";
	}

}
