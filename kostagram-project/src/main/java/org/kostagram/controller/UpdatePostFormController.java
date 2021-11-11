package org.kostagram.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.PostDAO;

public class UpdatePostFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("POST")==false) {
			throw new ServletException("게시글 수정은 post 방식만 허용됩니다");
		}
		request.setAttribute("postVO", PostDAO.getInstance().getPostDetail(request.getParameter("postId")));
		request.setAttribute("url", "post/update-post.jsp");
		return "layout.jsp";
	}
	
}
