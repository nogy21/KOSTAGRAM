package org.kostagram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kostagram.model.PostDAO;
import org.kostagram.model.PostVO;

public class PostDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String postId = request.getParameter("postId");
	
		PostVO postVO = PostDAO.getInstance().getPostDetail(postId);
		request.setAttribute("postVO", postVO);
		
		request.setAttribute("url", "post/detail-post.jsp");
		return "layout.jsp";
	}

}
