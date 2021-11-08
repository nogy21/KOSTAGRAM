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
		System.out.println(memberId+password);
		HttpSession session=request.getSession(false);
		MemberVO memberVO = MemberDAO.getInstance().login(memberId, password);
		String info="";
		if(memberVO==null) {
			info="아이디 또는 비밀번호를 확인하세요";
			request.setAttribute("responsebody", info);
			System.out.println("실패");

			return "AjaxView";
		}else {
			session.setAttribute("loginVO", memberVO);
			System.out.println("성공");
			return "redirect:MainController.do";
		}
	}

}
