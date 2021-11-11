package org.kostagram.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kostagram.model.MemberDAO;
import org.kostagram.model.MemberVO;

public class LoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// post 방식만 로그인 처리
		if(request.getMethod().equals("POST")==false) {
			throw new ServletException("로그인은 post방식만 가능합니다!");
		}
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		HttpSession session=request.getSession(false);
		MemberVO memberVO = MemberDAO.getInstance().login(memberId, password);
		String info=null;
		if(memberVO==null) {
			info="아이디 혹은 비밀번호를 확인하세요";
			request.setAttribute("responsebody", info);
		} else {
			info="성공";
			session.setAttribute("loginVO", memberVO);
			request.setAttribute("responsebody", info);
		}
		return "AjaxView";
	}

}
