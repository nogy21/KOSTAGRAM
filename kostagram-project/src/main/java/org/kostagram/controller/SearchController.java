package org.kostagram.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.MemberDAO;
import org.kostagram.model.MemberVO;
import org.kostagram.model.PostDAO;
import org.kostagram.model.PostVO;

public class SearchController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String searchWord=request.getParameter("searchWord");
		ArrayList<MemberVO> searchMemberList=MemberDAO.getInstance().searchMemberByWord(searchWord);
		ArrayList<PostVO> searchPostList=PostDAO.getInstance().searchMemberByWord(searchWord);
		request.setAttribute("searchMemberList", searchMemberList);
		request.setAttribute("searchPostList", searchPostList);
		request.setAttribute("url", "post/search-result.jsp");
		return "layout.jsp";
	}

}
