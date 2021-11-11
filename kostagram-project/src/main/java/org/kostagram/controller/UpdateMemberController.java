package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kostagram.model.MemberDAO;
import org.kostagram.model.MemberVO;

public class UpdateMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberId = request.getParameter("memberId");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		MemberVO memberVO = MemberDAO.getInstance().UpdateMember(memberId, email, name);
		HttpSession session = request.getSession(false);
		session.setAttribute("loginVO", memberVO);
		
		return "redirect:UpdateMemberFormController.do";
	}

}
