package org.kostagram.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kostagram.model.MemberDAO;
import org.kostagram.model.MemberVO;

public class UpdateMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    if (request.getMethod().equals("POST") == false) {
            throw new ServletException("게시글 수정은 post 방식만 허용됩니다");
        }
	    String memberId = request.getParameter("memberId");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		MemberVO memberVO = MemberDAO.getInstance().UpdateMember(memberId, email, name);
		HttpSession session = request.getSession(false);
		session.setAttribute("loginVO", memberVO);
		
		return "redirect:UpdateMemberFormController.do";
	}

}
