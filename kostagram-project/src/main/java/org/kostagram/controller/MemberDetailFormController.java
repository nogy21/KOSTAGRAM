package org.kostagram.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.MemberDAO;
import org.kostagram.model.MemberVO;
import org.kostagram.model.PostVO;

public class MemberDetailFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberId = request.getParameter("memberid");
		ArrayList<MemberVO> detail = MemberDAO.getInstance().getMemberDetail(memberId);
		ArrayList<PostVO> post = MemberDAO.getInstance().myPost(memberId);
		request.setAttribute("myPost", post);
		request.setAttribute("memberDetail", detail);
		request.setAttribute("url", "member/member-detail-form.jsp");
		return "layout.jsp";
	}

}
